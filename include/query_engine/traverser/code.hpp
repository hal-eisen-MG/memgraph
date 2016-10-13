#pragma once

#include <string>

#include "query_engine/util.hpp"

struct Code
{
    std::string code;

    void reset() { code = ""; }
};

namespace code
{

// TODO: one more abstraction level
// TODO: UNIT tests

const std::string transaction_begin = "DbAccessor t(db);";

const std::string transaction_commit = "t.commit();";

const std::string set_property = "{}.set({}, std::move(args[{}]));";

// create vertex e.g. CREATE (n:PERSON {name: "Test", age: 23})
const std::string create_vertex = "auto {} = t.vertex_insert();";
const std::string create_label = "auto &{0} = t.label_find_or_create(\"{0}\");";
const std::string add_label = "{}.add_label({});";

const std::string vertex_property_key =
    "auto {}=t.vertex_property_key(\"{}\",args[{}].key.flags());";
const std::string edge_property_key =
    "auto {}=t.edge_property_key(\"{}\",args[{}].key.flags());";

// create edge e.g CREATE (n1)-[r:COST {cost: 100}]->(n2)
const std::string create_edge = "auto {} = t.edge_insert({},{});";
const std::string find_type = "auto &{0} = t.type_find_or_create(\"{0}\");";
const std::string set_type = "{}.edge_type({});";

const std::string args_id = "Int32 id = args[{}].as<Int32>();";

const std::string vertex_accessor_args_id =
    "auto vertex_accessor = t.vertex_find(id.value());";

const std::string match_vertex_by_id =
    "auto option_{0} = t.vertex_find(args[{1}].as<Int64>().value());\n"
    "        if (!option_fill(option_{0})) return t.commit(), false;\n"
    "        auto {0}=option_{0}.take();";
const std::string match_edge_by_id =
    "auto option_{0} = t.edge_find(args[{1}].as<Int64>().value());\n"
    "        if (!option_fill(option_{0})) return t.commit(), false;\n"
    "        auto {0}=option_{0}.take();";

const std::string write_entity = "stream.write_field(\"{0}\");\n"
                                 "        stream.write_record();\n"
                                 "        stream.write_list_header(1);\n"
                                 "        stream.write({0});\n"
                                 "        stream.chunk();"
                                 "        stream.write_meta(\"rw\");\n";

const std::string write_all_vertices =
    "stream.write_field(\"{0}\");\n"
    "        iter::for_all(t.vertex_access(), [&](auto vertex) {{\n"
    "            if (vertex.fill()) {{\n"
    "                stream.write_record();\n"
    "                stream.write_list_header(1);\n"
    "                stream.write(vertex);\n"
    "                stream.chunk();\n"
    "            }}\n"
    "        }});\n"
    "        stream.write_meta(\"rw\");\n";

const std::string find_and_write_vertices_by_label =
    "auto &label = t.label_find_or_create(\"{1}\");\n"
    "        stream.write_field(\"{0}\");\n"
    "        label.index().for_range(t).for_all([&](auto vertex) {{\n"
    "            stream.write_record();\n"
    "            stream.write_list_header(1);\n"
    "            stream.write(vertex);\n"
    "            stream.chunk();\n"
    "        }});\n"
    "        stream.write_meta(\"rw\");\n";

const std::string write_all_edges =
    "stream.write_field(\"{0}\");\n"
    "        iter::for_all(t.edge_access(), [&](auto edge) {{\n"
    "            if (edge.fill()) {{\n"
    "                stream.write_record();\n"
    "                stream.write_list_header(1);\n"
    "                stream.write(edge);\n"
    "                stream.chunk();\n"
    "            }}\n"
    "        }});\n"
    "        stream.write_meta(\"rw\");\n";

const std::string find_and_write_edges_by_type =
    "auto &type = t.type_find_or_create(\"{1}\");\n"
    "        stream.write_field(\"{0}\");\n"
    "        type.index().for_range(t).for_all([&](auto edge) {{\n"
    "            stream.write_record();\n"
    "            stream.write_list_header(1);\n"
    "            stream.write(edge);\n"
    "            stream.chunk();\n"
    "        }});\n"
    "        stream.write_meta(\"rw\");\n";

const std::string count_vertices_for_one_label =
    "size_t count = 0;\n"
    "auto &label = t.label_find_or_create(\"{1}\");\n"
    "        label.index().for_range(t).for_all([&](auto vertex) {{\n"
    "            count++;\n"
    "        }});\n"
    "        stream.write_field(\"count({0})\");\n"
    "        stream.write_record();\n"
    "        stream.write_list_header(1);\n"
    "        stream.write(Int64(count));\n"
    "        stream.chunk();\n"
    "        stream.write_meta(\"r\");\n";

// TODO: vertices and edges
const std::string count =
    "size_t count = 0;\n"
    "        t.vertex_access().fill().for_all(\n"
    "            [&](auto vertex) {{ ++count; }});\n"
    "        stream.write_field(\"count({0})\");\n"
    "        stream.write_record();\n"
    "        stream.write_list_header(1);\n"
    "        stream.write(Int64(count));\n"
    "        stream.chunk();\n"
    "        stream.write_meta(\"r\");\n";

const std::string return_true = "return true;";

const std::string todo = "// TODO: {}";
const std::string print_properties =
    "cout << \"{0}\" << endl;\n"
    "        cout_properties({0}.properties());";
const std::string print_property =
    "cout_property(\"{0}\", {0}.property(\"{1}\"));";
}

// DELETE
const std::string detach_delete_all_nodes =
    "t.vertex_access().fill().isolated().for_all("
    "        [&](auto a) {{ a.remove(); }});";
