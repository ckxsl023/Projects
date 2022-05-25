<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : Practical1.xsl
    Created on : 29 March 2022, 1:10 pm
    Author     : admin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/orders">
        <order>
            <xsl:apply-templates select="order"/>
        </order>
    </xsl:template>
    
    <xsl:template match="order">
        <purchaseOrder>
            <orderNumber>
                <xsl:value-of select="id/text()"/>
            </orderNumber>
            <client>
                <xsl:value-of select="customer/text()"/>
            </client>
            <location>
                <xsl:value-of select="address/text()"/>
            </location>
            <property>
                <xsl:for-each select="items/item">
                        <type>
                        <xsl:value-of select="name/text()"/>
                        </type>
                </xsl:for-each>
            </property>
        </purchaseOrder>
    </xsl:template>
    
</xsl:stylesheet>
