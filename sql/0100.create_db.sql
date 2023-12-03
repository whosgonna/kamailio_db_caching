CREATE TABLE dids (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    did varchar(11) NOT NULL,
    route_id INT NOT NULL,
    failure_route_id INT NOT NULL,
    description VARCHAR(255)
);

INSERT INTO dids
 ( did,            route_id, failure_route_id, description ) VALUES
 ( '15555551000',        101,             1006, 'Alice' )
,( '15555551200',        103,             1019, 'Bob' )
,( '15555551300',        105,             1138, 'Carol')
,( '15555551400',        107,             1004, 'David')
;
