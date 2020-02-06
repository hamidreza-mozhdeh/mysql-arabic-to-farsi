DROP PROCEDURE IF EXISTS `sp_replace_arabic_with_farsi`;

DELIMITER $$

CREATE PROCEDURE `sp_replace_arabic_with_farsi` (IN _table VARCHAR(30) CHARSET utf8, IN _col VARCHAR(30) CHARSET utf8)
	MODIFIES SQL DATA
BEGIN

	SET @table_ := _table;
	SET @col_ := _col;
	
	SET @sql_ := CONCAT(
		"UPDATE `", @table_, "` SET `",	@col_, "` = ", 
		"
			REPLACE(
				REPLACE(
					REPLACE(
						REPLACE(`",	@col_, "`, 0xDB80, 0xD987D994) /* هٔ -> ۀ */
					, 0xD98A, 0xDB8C) /* ي -> ی */
				, 0xD989, 0xDB8C) /* ى -> ی */
			, 0xD983, 0xDAA9); /* ك -> ک */
		"
	);
	PREPARE STMT FROM @sql_;
	
	EXECUTE STMT;
END$$

DELIMITER ;


