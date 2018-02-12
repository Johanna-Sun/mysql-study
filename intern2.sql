USE etssub;

select `tbSet`.`fdForeignID`, `tbPpr`.`fdEntityForeignID`, `tbPpr`.`fdOrder` from `tbSet`
left join `tbCtrl` on `tbSet`.`id` = `tbCtrl`.`fdSetID`
left join `tbPpr` on `tbSet`.`fdForeignID` = `tbPpr`.`fdSetForeignID`
	where `tbCtrl`.`fdSetID` is NULL
	or `tbCtrl`.`fdType` != 'action.record'
	or `tbPpr`.`fdSetForeignID` is NULL
	or substring_index(`tbCtrl`.`fdFilename`,'_',1) != `tbPpr`.`fdEntityForeignID`
	or CAST(substring_index(`tbCtrl`.`fdFilename`,'_',-1) as SIGNED INTEGER) != `tbPpr`.`fdOrder`;
