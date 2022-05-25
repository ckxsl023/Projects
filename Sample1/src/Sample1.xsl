<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : Sample1.xsl
    Created on : 29 March 2022, 7:00 am
    Author     : admin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/persons">
        <customer>
            <xsl:apply-templates select="person"/>
        </customer>
    </xsl:template>
    
    <xsl:template match="person">
        <customer sex="{@gender}">
            <name>
                <xsl:value-of select="lastname/text()"/>
                <xsl:value-of select="', '"/>
                <xsl:value-of select="firstname/text()"/>
            </name>
            <age>
                <xsl:value-of select="age/text()"/>
            </age>
        </customer>
    </xsl:template>

</xsl:stylesheet>
