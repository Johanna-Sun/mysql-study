USE etssvc;

-- 统计老师数
select /* `tbteacher`.`id`, */count(`tbteacher`.`id`) from `tbteacher`
	where EXISTS (select `tbclass`.`fdTeacherID` from `tbclass`
						where `tbteacher`.`id` = `tbclass`.`fdTeacherID`
						and EXISTS (select `tbhomework`.`fdClassID` from `tbhomework`
										      where `tbclass`.`id` = `tbhomework`.`fdClassID`
										      and unix_timestamp(`tbhomework`.`fdEnd`) > unix_timestamp('2017-12-31 23:59:59')
		                      and unix_timestamp(`tbhomework`.`fdEnd`) < unix_timestamp('2018-12-31 23:59:59')));

-- 总次数
select count(`tbhomework`.`id`) from `tbhomework`

-- 需要做完的作业
select count(`tbaccountclass`.`fdClassID`) from `tbaccountclass`
	where EXISTS(select `tbhomework`.`fdClassID` from `tbhomework`
					where `tbhomework`.`fdClassID` = `tbaccountclass`.`fdClassID`
					and unix_timestamp(`tbhomework`.`fdEnd`) > unix_timestamp('2017-12-31 23:59:59')
					and unix_timestamp(`tbhomework`.`fdEnd`) < unix_timestamp('2018-12-31 23:59:59'));

-- 完成作业的人数（表格中并没有要求显示）
-- select count(`tbhomeworkscore`.`id`) from `tbhomeworkscore`
-- 	where EXISTS(select `tbhomework`.`id` from `tbhomework`
-- 					where `tbhomework`.`id` = `tbhomeworkscore`.`fdHomeworkID`
-- 					and unix_timestamp(`tbhomework`.`fdEnd`) > unix_timestamp('2017-12-31 23:59:59')
-- 					and unix_timestamp(`tbhomework`.`fdEnd`) < unix_timestamp('2018-12-31 23:59:59'))
-- 	and `tbhomeworkscore`.`fdComplete` = 100;

-- 完成率（完成作业的人数/需要完成作业的人）
select (select count(`tbhomeworkscore`.`id`)*1.0 as c2 from `tbhomeworkscore`
						where EXISTS(select `tbhomework`.`id` from `tbhomework`
					where `tbhomework`.`id` = `tbhomeworkscore`.`fdHomeworkID`
					and unix_timestamp(`tbhomework`.`fdEnd`) > unix_timestamp('2017-12-31 23:59:59')
					and unix_timestamp(`tbhomework`.`fdEnd`) < unix_timestamp('2018-12-31 23:59:59'))
	and `tbhomeworkscore`.`fdComplete` = 100)
					/
					nullif((select count(`tbaccountclass`.`fdClassID`) from `tbaccountclass`
	where EXISTS(select `tbhomework`.`fdClassID` from `tbhomework`
					where `tbhomework`.`fdClassID` = `tbaccountclass`.`fdClassID`
					and unix_timestamp(`tbhomework`.`fdEnd`) > unix_timestamp('2017-12-31 23:59:59')
					and unix_timestamp(`tbhomework`.`fdEnd`) < unix_timestamp('2018-12-31 23:59:59'))),0)
          *100;


-- 听说模拟专项训练同步练习etc...

USE etsctn;

select count(`tbserialset`.`fdType`) from `tbserialset`
	where `tbserialset`.`fdType` = 1;

select count(`tbserialset`.`fdType`) from `tbserialset`
	where `tbserialset`.`fdType` = 2;

select count(`tbserialset`.`fdType`) from `tbserialset`
	where `tbserialset`.`fdType` = 3;

select count(`tbserialset`.`fdType`) from `tbserialset`
	where `tbserialset`.`fdType` = 4;

select count(`tbserialset`.`fdType`) from `tbserialset`
	where `tbserialset`.`fdType` = 5;

select count(`tbserialset`.`fdType`) from `tbserialset`
	where `tbserialset`.`fdType` = 6;
