SELECT DISTINCT
	tbSet.fdForeignID AS set_foreign_id,
	substring_index(tbCtrl.fdFilename, '_', 1) AS entity_foreign_id,
	substring_index(tbCtrl.fdFilename, '_' ,- 1) AS order_id
FROM
	tbCtrl
LEFT JOIN tbSet ON tbSet.id = tbCtrl.fdSetID
LEFT JOIN tbPpr ON tbSet.fdForeignID = tbPpr.fdSetForeignID
AND substring_index(tbCtrl.fdFilename, '_', 1) = tbPpr.fdEntityForeignID
AND CAST(
	substring_index(tbCtrl.fdFilename, '_' ,- 1) AS SIGNED INTEGER
) = tbPpr.fdOrder
 WHERE
	tbSet.id IS NOT NULL
AND tbCtrl.fdType = 'action.record'
AND locate('_', tbCtrl.fdFilename) > 0
AND tbPpr.id IS NULL
AND tbSet.fdForeignID IN (
	SELECT DISTINCT
		fdSetForeignID
	FROM
		etsctn.tbSerialSet
	AND fdType = 1
);