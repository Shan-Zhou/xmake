-- add modes: debug and release 
add_rules("mode.debug", "mode.release")

-- add target
target("${TARGETNAME}")

    -- set kind
    set_kind("shared")

    -- add files
    add_files("src/interfaces.d") 

-- add target
target("${TARGETNAME}_demo")

    -- set kind
    set_kind("binary")

    -- add deps
    add_deps("${TARGETNAME}")

    -- add files
    add_files("src/main.d") 

${FAQ}
