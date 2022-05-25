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
            <xsl:apply-templates select="ordertype"/>
            <xsl:apply-templates select="restaurant"/>
            <xsl:apply-templates select="employee"/>
        </customerOrder>
    </xsl:template>
    <xsl:template match="ordertype">
        <itemData>
            <itemID>
                 <xsl:value-of select="orderID/text()"/>
            </itemID>
            <itemName>
                <xsl:value-of select="orderName/text()"/>
            </itemName>
            <itemDescription>
                <xsl:value-of select="description/text()"/>
            </itemDescription>
            <itemPrice>
                <xsl:value-of select="orderPrice/text()"/>
            </itemPrice>
            <itemQuantity>
                <xsl:value-of select="orderQuantity/text()"/>
            </itemQuantity>
        </itemData>
    </xsl:template>
    <xsl:template match="restaurant">
        <branch>
            <address>
                <xsl:value-of select="address/text()"/>
            </address>
            <zip>
                <xsl:value-of select="postalcode/text()"/>
            </zip>
        </branch>
    </xsl:template>
    <xsl:template match="employee">
        <rider>
            <riderID>
                <xsl:value-of select="employeeID/text()"/>
            </riderID>
            <riderName>
                <xsl:value-of select="name/text()"/>
            </riderName>
            <contactNo>
                <xsl:value-of select="contact/text()"/>
            </contactNo>
        </rider>
    </xsl:template>

</xsl:stylesheet>
