CREATE ENUM Status VALUES { ACTIVE, DISABLED };
CREATE INDEX ON :`label`;
CREATE INDEX ON :`label2`(`prop2`);
CREATE INDEX ON :`label2`(`prop`);
CREATE CONSTRAINT ON (u:`label`) ASSERT EXISTS (u.`ext`);
CREATE CONSTRAINT ON (u:`label2`) ASSERT u.`prop2`, u.`prop` IS UNIQUE;
CREATE INDEX ON :__mg_vertex__(__mg_id__);
CREATE (:__mg_vertex__:`edge_index_from` {__mg_id__: 0});
CREATE (:__mg_vertex__:`edge_index_to` {__mg_id__: 1});
CREATE (:__mg_vertex__:`label2` {__mg_id__: 2, `prop2`: ["kaj", 2, Null, {`prop4`: -1.341}], `prop`: "joj", `ext`: 2});
CREATE (:__mg_vertex__:`label`:`label2` {__mg_id__: 3, `prop`: "joj", `ext`: 2});
CREATE (:__mg_vertex__:`label2` {__mg_id__: 4, `prop2`: 2, `prop`: 1, `status`: Status::ACTIVE});
CREATE (:__mg_vertex__:`label2` {__mg_id__: 5, `prop2`: 2, `prop`: 2, `status`: Status::DISABLED});
MATCH (u:__mg_vertex__), (v:__mg_vertex__) WHERE u.__mg_id__ = 0 AND v.__mg_id__ = 1 CREATE (u)-[:`edge_type`]->(v);
MATCH (u:__mg_vertex__), (v:__mg_vertex__) WHERE u.__mg_id__ = 0 AND v.__mg_id__ = 1 CREATE (u)-[:`edge_type` {`prop`: 1}]->(v);
MATCH (u:__mg_vertex__), (v:__mg_vertex__) WHERE u.__mg_id__ = 3 AND v.__mg_id__ = 2 CREATE (u)-[:`link` {`prop`: -1, `ext`: [false, {`k`: "l"}]}]->(v);
MATCH (u:__mg_vertex__), (v:__mg_vertex__) WHERE u.__mg_id__ = 3 AND v.__mg_id__ = 3 CREATE (u)-[:`link` {`prop`: -1, `ext`: [false, {`k`: "l"}]}]->(v);
MATCH (u:__mg_vertex__), (v:__mg_vertex__) WHERE u.__mg_id__ = 3 AND v.__mg_id__ = 4 CREATE (u)-[:`link` {`prop`: -1, `ext`: [false, {`k`: "l"}]}]->(v);
MATCH (u:__mg_vertex__), (v:__mg_vertex__) WHERE u.__mg_id__ = 3 AND v.__mg_id__ = 5 CREATE (u)-[:`link` {`prop`: -1, `ext`: [false, {`k`: "l"}]}]->(v);
DROP INDEX ON :__mg_vertex__(__mg_id__);
MATCH (u) REMOVE u:__mg_vertex__, u.__mg_id__;
CREATE EDGE INDEX ON :`edge_type`;
CREATE EDGE INDEX ON :`edge_type`(`prop`);
