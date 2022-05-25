<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : EX3XSL.xsl
    Created on : 15 March 2022, 12:31 pm
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
                <title>EX3XSL.xsl</title>
            </head>
            <body>
                
                <xsl:apply-templates select = "article"/>  
            </body>
        </html>
    </xsl:template>
    
<xsl:template match="article">
  <p>
    <xsl:apply-templates select="headline"/>  
    <xsl:apply-templates select="source"/>  
    <xsl:apply-templates select="pubDate"/>
    <xsl:apply-templates select="aBody"/>
  </p>
</xsl:template>

<xsl:template match="headline">
    <span style="color:#ff0000">
    <h1><xsl:value-of select="."/></h1></span>
    <br />
</xsl:template>

<xsl:template match="source">   
    <b><xsl:apply-templates/> </b>
    <br />
</xsl:template>

<xsl:template match="writer">
<span style="color:#0000EE">   
    <u><xsl:value-of select="."/></u></span>
</xsl:template>

<xsl:template match="email">   
    <span style="color:#0000EE">   
    <u><xsl:value-of select="."/></u></span>
</xsl:template>

<xsl:template match="pubDate">   
    
    <span style="font-size:80%">   
    <b><xsl:apply-templates/></b></span>
    <br/><br/>
</xsl:template>

<xsl:template match="underline">   
    <span style="color:#808080">  
    <u><xsl:value-of select="."/></u></span>
</xsl:template>

<xsl:template match="aBody">   
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="para">   
    <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="bold">
    <span style="font-size:110%">
    <b><xsl:apply-templates/></b></span>
</xsl:template>

<xsl:template match="italic">   
    <span style="color:#FF0000">  
    <i><xsl:value-of select="."/></i></span>
</xsl:template>

<xsl:template match="bullet">   
    <ul><li><xsl:value-of select="."/></li></ul>
</xsl:template>


</xsl:stylesheet>
