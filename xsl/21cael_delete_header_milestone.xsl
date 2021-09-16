<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    exclude-result-prefixes="tei">
    <xsl:output method = "xml" indent="yes" omit-xml-declaration="no" /> 
    <!-- 21cael_delete_header_milestone: delete header, milestone, other: -->
    <!-- 21cael_delete_header_milestone: transform TEI into an intermediate format for merging to parallel HTML page -->
    <xsl:strip-space elements="*"/>
    <xsl:include href="copy.xsl"/>
    <!-- delete elements and all their descendants -->
    <xsl:template match="//tei:milestone"/>
    <xsl:template match="//tei:teiHeader"/>
    <!-- keep only divs with @type textpart and s descendants -->
    <xsl:template match="tei:div[@type='textpart' and not(descendant::tei:s)]"/>
    <!-- for divs with @type textpart and s descendants, add @class and @title -->
    <xsl:template match="tei:div[@type='textpart' and descendant::tei:s]">
        <xsl:copy>
            <xsl:attribute name="class">post</xsl:attribute>
            <xsl:attribute name="title"><xsl:number></xsl:number></xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- remove p, keep children -->
    <xsl:template match="tei:p">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- from choice keep only abbr -->
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:abbr"/>
    </xsl:template>
    <!-- add @title with construed numbering -->
    <xsl:template match="tei:s">
        <xsl:copy>
            <xsl:attribute name="title"><xsl:value-of select="../../@n"/><xsl:text>.</xsl:text><xsl:number></xsl:number></xsl:attribute>
            <xsl:apply-templates select="@*[not(name()='part')]|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
