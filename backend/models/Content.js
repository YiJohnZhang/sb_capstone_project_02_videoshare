const db = require('../database/db');
const { sqlCreateQueryBuilder, sqlFilterQueryBuilder, sqlUpdateQueryBuilder } = require('../helpers/sqlQueryingHelper');
const {
	NotFoundError,
	ExpressError
} = require('../modules/utilities');

//	Properties to return for a query
const QUERY_GENERAL_PROPERTIES = `
	id,
	title,
	summary,
	description,
	link,
	date_created AS "dateCreated",
	date_standby AS "dateStandby",
	date_published AS "datePublished"`;
const QUERY_PRIVATE_PROPERTIES = `
	status, 
	owner, 
	contract_type AS "contractType", 
	contract_details AS "contractDetails", 
	contract_signed AS "contractSigned"`;

//	JSON-SQL Mapping Constants
const JSON_SQL_SET_MAPPING = {
	dateCreated: "date_created",
	dateStandby: "date_standby",
	datePublished: "date_published",
	contractType: "contract_type", 
	contractDetails: "contract_details", 
	contractSigned: "contract_signed"
}
const JSON_SQL_QUERY_MAPPING = {
	title: 'title ILIKE'
}

/** Related functions for Content. */
class Content {

	static relationName = 'contents';

	/**	Create content with data.
	 *
	 *	=> { ... }
	 *
	 *	Throws BadRequestError for duplicates.
	 **/
	static async create(newRecordObject, ntomJoin = []){

		try{
			
			await db.query('BEGIN');

			const { parameterizedINSERTPropertyNames, parameterizedINSERTPropertyIndices, insertParameters } = sqlCreateQueryBuilder(newRecordObject, JSON_SQL_SET_MAPPING);

			const result = await db.query(`
				INSERT INTO ${this.relationName} ${parameterizedINSERTPropertyNames}
					VALUES ${parameterizedINSERTPropertyIndices}
					RETURNING ${QUERY_GENERAL_PROPERTIES}`, insertParameters);

			const modelNameObject = result.rows[0];

			if(ntomJoin){

				const JOIN_MODEL_NAME = 'contents_users_join';
				const JOIN_MODEL_KEY = '(user_id, content_id)';
				const JOIN_MODEL_IDX = '($1, $2)';

				newRecordObject.contractSigned.forEach((entry) => {

					await db.query(`
						INSERT INTO ${JOIN_MODEL_NAME} ${JOIN_MODEL_KEY}
							VALUES ${JOIN_MODEL_IDX}
							RETURNING ${JOIN_MODEL_KEY}`,
							[ newRecordObject.title, entry.username ]);
				
				});

			}

			await db.query('COMMIT');

			return modelNameObject;

		}catch(error){
			await db.query('ROLLBACK');
			throw new ExpressError(499, `ERR_MULT_NEW_REC_DBFAIL`);
		}

	}

	/**	Find all matchiing relationName.
	 *	Optional: filter data in the form of `queryObject`.
	 *	=> [ QUERY_GENERAL_PROPERTIES, ...]
	 **/
	static async getAll(queryObject) {

		const sqlQueryBeforeWHERE = (`
			SELECT ${QUERY_GENERAL_PROPERTIES}
			FROM ${this.relationName}`);
		const sqlQueryAfterWHERE = (`ORDER BY date_published`);
		
		let result;

		if(queryObject){
			
			if(queryObject.title)
				queryObject.title = `%${queryObject.title}%`

			const { parameterizedWHERE, whereParameters } = sqlFilterQueryBuilder(queryObject, JSON_SQL_QUERY_MAPPING);
			result = await db.query(`${sqlQueryBeforeWHERE} ${parameterizedWHERE} ${sqlQueryAfterWHERE}`, whereParameters);

		}else{
			result = await db.query(`${sqlQueryBeforeWHERE} ${sqlQueryAfterWHERE}`);
		}

		return result.rows;
	
	}

	/**	Given a pk, return data about relationName.
	 *
	 *	=> QUERY_GENERAL_PROPERTIES
	 *
	 *	Throws NotFoundError if relationName not found.
	 **/
	static async getByPK(pk) {

		const result = await db.query(`
			SELECT ${QUERY_GENERAL_PROPERTIES}
				FROM ${this.relationName}
				WHERE id = $1`,
			[pk]
		);

		const contentObject = result.rows[0];

		if (!contentObject)
			throw new NotFoundError(`Cannot find ${this.relationName}: ${pk}`);

		return contentObject;

	}

	/**	Given a username, and is reference user, return full data.
	 *	
	 *	=> QUERY_GENERAL_PROPERTIES, QUERY_PRIVATE_PROPERTIES
	 /
	 */
	static async getByPKPrivate(pk) {

		const result = await db.query(`
			SELECT ${QUERY_GENERAL_PROPERTIES}, ${QUERY_PRIVATE_PROPERTIES}
				FROM ${this.relationName}
				WHERE id = $1`,
			[pk]
		);

		const contentObject = result.rows[0];

		if (!contentObject)
			throw new NotFoundError(`Cannot find ${this.relationName}: ${pk}`);

		return contentObject;

	}

	/**	Update relationName data with `updateRecordObject`.
	 *
	 *	This is for a partial update of a record; and it only changes provided ones.
	 *
	 *	`updateRecordObject` may include any of the following:
	 *		{ ... }
	 *
	 *	=> QUERY_GENERAL_PROPERTIES
	 *
	 *	Throws NotFoundError if not found.
	 *	@param {*} pk - the primary key
	 *	...
	 *	@param {object} updateRecordObject - data to update the primary key
	 */
	static async update(pk, updateRecordObject) {

		await this.getByPK(pk);

		// do something with `updateRecordObject` if necessary, i.e. remove certain properties that are forbidden to be updated or modify passed values

		const { parameterizedSET, setParameters } = sqlUpdateQueryBuilder(updateRecordObject, JSON_SQL_SET_MAPPING);
		const pkParameterIndex = "$".concat(setParameters.length + 1);

		const updateQuerySQL = `
			UPDATE ${this.relationName} 
				SET ${parameterizedSET} 
				WHERE id = ${pkParameterIndex} 
				RETURNING ${QUERY_GENERAL_PROPERTIES}`;
		const result = await db.query(updateQuerySQL, [...setParameters, pk]);

		const contentObject = result.rows[0];
		return contentObject;

	}

	/**	Delete relationName from database by `pk`.
	 *
	 *	=> `undefined`.
	 **/
	static async delete(pk, username) {

		const JOIN_MODEL_NAME = 'contents_users_join';

		let result = await db.query(`
			DELETE
				FROM ${JOIN_MODEL_NAME}
				WHERE content_id = $1 AND user_id = $2
				RETURNING content_id, user_id`, [pk, username]);

		const modelNameObject = result.rows[0];

		if (!modelNameObject)
			throw new NotFoundError(`No ${JOIN_MODEL_NAME}: (${pk}, ${fk})`);

	}

}

module.exports = Content;