#pragma once

#include <string>

#include "exceptions/exceptions.hpp"
#include "logging/default.hpp"
#include "utils/string/join.hpp"

// TODO:
//     * all libraries have to be compiled in the server compile time
//     * compile command has to be generated

class CodeCompiler
{
public:
    CodeCompiler() : logger(logging::log->logger("CodeCompiler")) {}

    void compile(const std::string &in_file, const std::string &out_file)
    {
        // generate compile command
        auto compile_command = utils::prints(
            "clang++",
            // "-std=c++1y -O2 -DNDEBUG",     // compile flags
            "-std=c++1y",    // compile flags // TODO: load from config file
            in_file,         // input file
            "-o", out_file,  // ouput file
            "-I./include",   // include paths (TODO: parameter)
            "-I../libs/fmt", // TODO: load from config
            "-L./ -lmemgraph_pic",
            "-shared -fPIC" // shared library flags
            );

        // synchronous call
        auto compile_status = system(compile_command.c_str());

        // if compilation has failed throw exception
        if (compile_status == -1) {
            throw QueryEngineException("Code compilation error. Generated code "
                                       "is not compilable or compilation "
                                       "settings are wrong");
        }

        logger.debug("SUCCESS: Query Code Compilation: {} -> {}", in_file,
                     out_file);
    }

protected:
    Logger logger;
};
