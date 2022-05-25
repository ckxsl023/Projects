<?xml version="1.0"?>

<!--
    Document   : breakfast.xsl
    Created on : 8 March 2022, 3:20 pm
    Author     : admin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>breakfast.xsl</title>
            </head>
                <body style="font-family:Arial;font-size:12pt;background-color:#EEEEEE">
                <xsl:for-each select="breakfast_menu/food">
                  <div style="background-color:teal;color:white;padding:4px">
                    <span style="font-weight:bold"><xsl:value-of select="name"/> - </span>
                    <xsl:value-of select="price"/>
                    </div>
                  <div style="margin-left:20px;margin-bottom:1em;font-size:10pt">
                    <p>
                    <xsl:value-of select="description"/>
                    <span style="font-style:italic"> (<xsl:value-of select="calories"/> calories per serving)</span>
                    </p>
                  </div>
                </xsl:for-each>
                </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

