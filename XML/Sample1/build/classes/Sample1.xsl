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
                <xsll:value-of select="lastname/text()"/>
                <xsll:value-of select="', '"/>
                <xsll:value-of select="firstname/text()"/>
            </name>
            <age>
                <xsll:value-of select="age/text()"/>
            </age>
        </customer>
    </xsl:template>

</xsl:stylesheet>
