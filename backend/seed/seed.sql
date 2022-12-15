--	SETUP
DROP DATABASE IF EXISTS sb_50_capstone_project_shortcollabs;
CREATE_DATABASE sb_50_capstone_project_shortcollabs;
\c sb_50_capstone_project_shortcollabs;

DROP TABLE IF EXISTS users, contents, roles, contents_users_join, roles_users_join;


-- DATABASE RELATIONS
--	users
CREATE TABLE users (

	--properties

);

--	contents
CREATE TABLE contents (

	--properties

);

--	roles
CREATE TABLE roles (

	--properties

);

--	contents_users_join
CREATE TABLE contents_users_join (

	--properties

);

--	roles_users_join
CREATE TABLE roles_users_join (

	--properties

);


--	DATABASE SEEDING
INSERT INTO users (username,firstname,lastname,birthdate,verified,account_status,email,pwd,picture,bio,is_elevated)
	VALUES
	('tuckerdiane', 'Harold', 'Smith', 1998-10-19, 1, 'active', 'ronald38@yahoo.com', $2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe, 'xsgamesm-33.jpg', 'Decision professional real each citizen level.', 1),
	('edward88', 'Carter', 'Johnson', 2004-3-13, 1, 'active', 'richard65@martin.net', 2022-12-14: TODO, 'xsgamesm-49.jpg', 'Maybe key community young ahead.', 1),
	('joanna15', 'Trent', 'Hayes', 1989-10-23, 1, 'active', 'helen38@hotmail.com', 2022-12-14: TODO, 'xsgamesm-23.jpg', 'Hotel together show gas seven.', 1),
	('kwilliams', 'Evette', 'Hoskison', 1994-4-13, 0, 'active', 'mcdonaldjohn@parks-miller.com', 2022-12-14: TODO, 'xsgamesf-48.jpg', 'Cell itself institution couple should.', 0),
	('palmermichael', 'Myra', 'Moreaux', 1991-10-24, 1, 'active', 'ljohnson@grimes-stevens.net', 2022-12-14: TODO, 'xsgamesf-38.jpg', 'Concern phone sport whatever professor material.', 0),
	('becklinda', 'Concha', 'Artyomova', 2005-8-6, 1, 'active', 'angelicaparker@nguyen.com', 2022-12-14: TODO, 'xsgamesf-61.jpg', 'Experience at Republican party large option project.', 0),
	('pattersonangela', 'Terri', 'Kramer', 1999-3-25, 1, 'active', 'laura85@barrett-hunter.com', 2022-12-14: TODO, 'xsgamesf-31.jpg', 'Resource source beyond beautiful product add mention.', 0),
	('crawfordshawn', 'Cindy', 'Rischelaux', 2004-1-4, 1, 'active', 'murphyjohn@hernandez-beard.info', 2022-12-14: TODO, 'xsgamesf-73.jpg', 'Figure seat everybody agency.', 0),
	('psampson', 'Lauren', 'Sauer', 1991-8-26, 1, 'active', 'bgray@hotmail.com', 2022-12-14: TODO, 'xsgamesf-9.jpg', 'Often beyond enough why.', 0),
	('wrightgeorge', 'Aileen', 'Jagerson', 1992-5-19, 1, 'active', 'tatemallory@sanford-armstrong.com', 2022-12-14: TODO, 'xsgamesf-3.jpg', 'Spring language his several drop.', 0),
	('webbmark', 'Sheila', 'Nieminen', 2003-5-21, 1, 'active', 'lauraconner@hotmail.com', 2022-12-14: TODO, 'xsgamesf-56.jpg', 'Term left view.', 0),
	('veronicahaynes', 'Leonre', 'Radish', 1991-9-5, 1, 'active', 'bookerricky@gmail.com', 2022-12-14: TODO, 'xsgamesf-72.jpg', 'Arrive indicate finally.', 0),
	('stacymartin', 'Trey', 'Hackwell', 1991-11-9, 1, 'active', 'murphytimothy@yahoo.com', 2022-12-14: TODO, 'xsgamesm-57.jpg', 'Result team myself western past movie enough.', 0),
	('mendozabrian', 'Richard', 'Van Dyke', 1987-6-10, 1, 'active', 'timothyritter@gmail.com', 2022-12-14: TODO, 'default.jpg', 'Start decision go lay.', 0),
	('wjefferson', 'Raymond', 'Stanton', 2003-4-8, 1, 'active', 'christophersims@castaneda-soto.com', 2022-12-14: TODO, 'xsgamesm-69.jpg', 'View beat service history field.', 0),
	('kingdonna', 'Erika', 'De Geer', 1996-6-7, 1, 'active', 'gcherry@mclaughlin.com', 2022-12-14: TODO, 'xsgamesf-46.jpg', 'Ever late future.', 0),
	('andersontroy', 'Yuliya', 'Tsvetaeva', 2000-9-22, 1, 'active', 'brian35@lopez.com', 2022-12-14: TODO, 'xsgamesf-44.jpg', 'Role letter site chair pretty coach.', 0),
	('zwilkins', 'Alexandria', 'Austin', 1990-8-8, 1, 'active', 'terrydestiny@ramos.net', 2022-12-14: TODO, 'xsgamesf-43.jpg', 'Form nearly win hit tend society agree.', 0),
	('ashley13', 'Sara', 'Pahlavi', 1999-3-15, 1, 'active', 'scottlori@hotmail.com', 2022-12-14: TODO, 'xsgamesf-34.jpg', 'Book shoulder similar.', 0),
	('tiffanywilson', 'Ludmilla', 'Volkova', 2001-11-25, 1, 'active', 'hjones@murphy-jacobs.net', 2022-12-14: TODO, 'xsgamesf-11.jpg', 'Late international management bag firm rather particularly.', 0),
	('cstpball', 'CSTP Ball', 'Ball', 1990-01-01, 1, 'active', 'cstpball@fakeemail.com', 2022-12-14: TODO, 'cstpball.jpg', 'Record what save plan add keep.', 0),
	('icariaball', 'Icaria', 'Ball', 1990-01-01, 1, 'active', 'icariaball@fakeemail.com', 2022-12-14: TODO, 'icariaball.jpg', 'Might north station step own wear stay.', 0),
	('tacoboiii', 'Taco', 'Boiii', 1990-01-01, 1, 'active', 'tacoboiii@fakeemail.com', 2022-12-14: TODO, 'tacoboii.jpg', 'Total behavior attention.', 0),
	('thatmitchellandwebblook', 'Mitchell', 'Webb', 1990-01-01, 1, 'active', 'thatmitchellandwebblook@fakeemail.com', 2022-12-14: TODO, 'thatmitchandwebblook.jpg', 'Begin money me young science.', 0),
	('kaliningradgeneral', 'Kaliningrad', 'General', 1990-01-01, 1, 'active', 'kaliningradgeneral@fakeemail.com', 2022-12-14: TODO, 'kaliningradgeneral.jpg', 'Treatment better little cover fact commercial.', 0),
	
INSERT INTO contents (title,summary,default_description,link,content_status,initiator,contract_type,contract_details,contract_signed,date_created,date_standby,date_published)
	VALUES
	("I\'m White, I\'m Black, I\'m Yellow, I\'m Red (Countryballs)", , 'Kurwaaaaa!\nincluding: France, USA, Switzerland and Russia\nSource: https://youtu.be/Em59yHA8k7I', 'Em59yHA8k7I_360p', 'legacy', 'cstpball', 'solo', , , 2022-12-12, 2022-12-26, 2022-12-26),
	('Coverage of People Buying a House and Living in It', , 'That Mitchell and Webb Look (s1 ep2)\nSource: https://youtu.be/gqK5AYiuC_w', 'gqK5AYiuC_w_360p', 'active', 'thatmitchellandwebblook', 'solo', , , 2022-12-12, 2022-12-26, 2022-12-26),
	('Talent Dredge', , 'Again, one of my favorites from the masters, Mitchell and Webb.\nSource: https://youtu.be/3I5udb-BDAQ', '3I5udb-BDAQ_360p', 'active', 'thatmitchellandwebblook', 'presplit', '2022-12-14: TODO', '[{"thatmitchellandwebblook":true, "???":true}]', 2022-12-12, 2022-12-26, 2022-12-26),
	('Bronze Orientation', , 'Bronze Orientation for stone-age chippers and tie-ers. A sketch from series 2 of That Mitchell and Webb Look.\nSource: https://youtu.be/nyu4u3VZYaQ', 'nyu4u3VZYaQ_360p', 'active', 'thatmitchellandwebblook', 'byview', '2022-12-14: TODO', '[{"thatmitchellandwebblook":true, "???":true}]', 2022-12-12, 2022-12-26, 2022-12-26),
	(2022-12-14: TODO, "marketing campaign for some brand", 'Lorem ispum.', , 'standby', '2022-12-14: TODO', 'presplit', '2022-12-14: TODO', '2022-12-14: TODO', 2022-12-12, 2022-12-26, ),
	(2022-12-14: TODO, 2022-12-14: TODO, 'HYPEEEEEEEEEEEEEEEEEE', , 'open', '2022-12-14: TODO', 'presplit', '2022-12-14: TODO', '2022-12-14: TODO', 2022-12-12, , ),
	
INSERT INTO roles (role_name)
	VALUES
	('Administrator'),
	('Creator'),
	('Brand'),
	('empty_1'),
	('empty_2'),
	('empty_3'),
	('empty_4'),
	('empty_5'),
	('empty_6'),
	('empty_7'),
	('Moderator'),
	('Brand Representative'),
	('empty_8'),
	('empty_9'),
	('empty_10'),
	('empty_11'),
	('empty_12'),
	('empty_13'),
	('empty_14'),
	('empty_15'),
	
INSERT INTO contents_users_join (user_id,content_id,content_description)
	VALUES
	('cstpball', 1, 'Kurwaaaaa!\nincluding: France, USA, Switzerland and Russia\nSource: https://youtu.be/Em59yHA8k7I'),
	('thatmitchellandwebblook', 2, 'That Mitchell and Webb Look (s1 ep2)\nSource: https://youtu.be/gqK5AYiuC_w'),
	('thatmitchellandwebblook', 3, 'Again, one of my favorites from the masters, Mitchell and Webb.\nSource: https://youtu.be/3I5udb-BDAQ'),
	('thatmitchellandwebblook', 4, 'Bronze Orientation for stone-age chippers and tie-ers. A sketch from series 2 of That Mitchell and Webb Look.\nSource: https://youtu.be/'),
	
INSERT INTO roles_users_join (user_id,role_id)
	VALUES
	('tuckerdiane', 1),
	('edward88', 1),
	('joanna15', 1),
	('zwilkins', 3),
	
