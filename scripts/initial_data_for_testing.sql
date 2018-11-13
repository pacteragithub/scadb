INSERT INTO rule_master (id, label, rule_type, key_points) VALUES (1, 'testlable', 'ke', 'test points');
INSERT INTO rule_keywords VALUES (1, 'test coverage', 'test keywords');

INSERT INTO rule_master (id, label, rule_type, key_points) VALUES (2, 'testlable', 'pa', 'test points');
INSERT INTO rule_pace VALUES (2, 99);

INSERT INTO rule_master (id, label, rule_type, key_points) VALUES (3, 'test in', 'in', 'test points');
INSERT INTO rule_interrupt VALUES (3, 20, 40);

INSERT INTO rule_master (id, label, rule_type, key_points) VALUES (4, 'test re', 're', 'test points');
INSERT INTO rule_regex VALUES (4, '%@$%^');
