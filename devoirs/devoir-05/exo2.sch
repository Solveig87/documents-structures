<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
    
    <sch:pattern>
        <sch:rule context="TEI">
            <sch:assert test="teiHeader and text">
                Un élément <sch:name/> contient un élément teiHeader et un élément text.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <sch:rule abstract="true" id="contient-p">
            <sch:assert test="self::*[child::p]">L'élément <sch:name/> doit contenir un élément p.</sch:assert>
        </sch:rule>
        
        <sch:rule context="sp">
            <sch:extends rule="contient-p"/>
        </sch:rule>
        
        <sch:rule context="projectDesc">
            <sch:extends rule="contient-p"/>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern abstract="true" id="structure-act">
        <sch:rule context="$element1">
            <sch:assert test="self::*[child::$element2]">L'élément <sch:name/> doit avoir un élément head.</sch:assert>
            <sch:assert test="count($element3) > 1">L'élément <sch:name/> doit contenir au moins deux scènes.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern is-a="structure-act" id="act">
        <sch:param name="element1" value="div[@type='act']"/>
        <sch:param name="element2" value="head"/>
        <sch:param name="element3" value="div[@type='scene']"/>
    </sch:pattern>
</sch:schema>