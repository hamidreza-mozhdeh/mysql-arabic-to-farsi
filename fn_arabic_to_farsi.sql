DROP FUNCTION IF EXISTS `fn_arabic_to_farsi`;

DELIMITER $$

CREATE FUNCTION `fn_arabic_to_farsi` (`_text` TEXT)
	RETURNS TEXT
BEGIN
	
	SET `_text` = REPLACE(`_text`, 0xD983, 0xDAA9); /* ك -> ک */
	SET `_text` = REPLACE(`_text`, 0xD989, 0xDB8C); /* ى -> ی */
	SET `_text` = REPLACE(`_text`, 0xD98A, 0xDB8C); /* ي -> ی */
	SET `_text` = REPLACE(`_text`, 0xDB80, 0xD987D994); /* هٔ -> ۀ */
	
	RETURN `_text`;
		
END$$

DELIMITER ;