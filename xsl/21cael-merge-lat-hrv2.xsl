<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
<!-- from intermediate files, merge Latin original and Croatian translation -->
    <!-- prepare for insertion into a HTML frame -->
        <xsl:output method="xml" indent="yes"/>
        <xsl:strip-space elements="*"/>
    <xsl:include href="copy.xsl"/>
    <xsl:variable name="hrv">
        <xsl:copy-of select="document('../data/cael-hrv.xml')//text"/>
    </xsl:variable>
        
        
        
        <xsl:template match="//div[@type]">
            <xsl:for-each select="div[@class]">
                <xsl:variable name="brojodlomka" select="./@title"/>
                <xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy>
                <xsl:apply-templates select="$hrv//div[@class='post' and @title=$brojodlomka]"/>
            </xsl:for-each>
            
        </xsl:template>
        
    
</xsl:stylesheet>