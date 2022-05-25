<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : final.xsl
    Created on : 30 April 2022, 2:17 am
    Author     : admin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="serviceReferences/service">
        <customerOrder>
            <xsl:apply-templates select="order"/>
        </customerOrder>
    </xsl:template>
    
    <xsl:template match="order">
        <customerOrder>
            <itemID>
                <xsl:value-of select="orderID/text()"/>
            </itemID>
            <xsl:if test="orderType">
                <xsl:for-each select="orderType">
                    <itemName>
                        <xsl:value-of select="orderName/text()"/>
                    </itemName>
                    <itemDescription>
                        <xsl:value-of select="description/text()"/>
                    </itemDescription>
                </xsl:for-each>
            </xsl:if>
        </customerOrder>
    </xsl:template>

</xsl:stylesheet>
