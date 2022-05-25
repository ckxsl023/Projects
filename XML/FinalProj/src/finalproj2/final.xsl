<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : final.xsl
    Created on : 2 May 2022, 2:06 am
    Author     : admin
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="servicereference/service">
        <html>
            <head>
                <title>final.xsl</title>
            </head>
            <body>
               <xsl:apply-templates select = "servicereference"/>
            </body>
        </html>
    </xsl:template>

<xsl:template match="servicereference">
  <p>
    <xsl:apply-templates select="ordertype"/>  
    <xsl:apply-templates select="customer"/>
    <xsl:apply-templates select="employee"/>
    <xsl:apply-templates select="payment"/>
  </p>
</xsl:template>

<xsl:template match="ordertype">
 <h2><center><strong>ORDER SERVICE DETAILS</strong></center></h2>
<hr />
<table border="1" style="border-collapse: collapse; width: 15%; height: 30px; margin-left: auto; margin-right: auto; text-align: center;">
<tbody>
<tr style="height: 21px;">
<td style="width: 50%; height: 35px; text-align: center;">Order Details</td>
</tr>
</tbody>
</table>
<table border="1" style="border-collapse: collapse; width: 15%; height: 30px; margin-left: auto; margin-right: auto; text-align: center;">
<tbody>
<tr style="height: 21px;">
<td style="width: 20%; height: 21px;">Order ID</td>
<td style="width: 80%; height: 21px;"><xsl:value-of select="orderID/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20%; height: 21px;">Name</td>
<td style="width: 80%; height: 21px;"> <xsl:value-of select="orderName/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.4367%; height: 21px;">Description</td>
<td style="width: 79.5633%; height: 21px;"><xsl:value-of select="description/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.4367%; height: 21px;">Price</td>
<td style="width: 79.5633%; height: 21px;">PHP <xsl:value-of select="orderPrice/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.4367%; height: 21px;">Discounted?</td>
<td style="width: 79.5633%; height: 21px;"></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.4367%; height: 21px;">Quantity</td>
<td style="width: 79.5633%; height: 21px;"><xsl:value-of select="orderQuantity/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.4367%; height: 21px;">Address</td>
<td style="width: 79.5633%; height: 21px;"><xsl:value-of select="address/text()"/></td>
</tr>
<tr>
<td style="width: 20.4367%;">Postal Code</td>
<td style="width: 79.5633%;"><xsl:value-of select="postalcode/text()"/></td>
</tr>
<tr>
<td style="width: 20.4367%;">City</td>
<td style="width: 79.5633%;"><xsl:value-of select="city/text()"/></td>
</tr>
</tbody>
</table>
<p></p>
</xsl:template>

<xsl:template match="customer">
<table border="1" style="border-collapse: collapse; width: 15%; height: 30px; margin-left: auto; margin-right: auto; text-align: center;">
<tbody>
<tr style="height: 30px;">
<td style="width: 100%; height: 30px;">Customer Details</td>
</tr>
</tbody>
</table>
<table border="1" style="border-collapse: collapse; width: 15%; height: 30px; margin-left: auto; margin-right: auto; text-align: center;">
<tbody>
<tr style="height: 21px;">
<td style="width: 20.2055%; height: 21px;">Customer ID</td>
<td style="width: 79.7945%; height: 21px;"><xsl:value-of select="customerID/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.2055%; height: 21px;">Name</td>
<td style="width: 79.7945%; height: 21px;"><xsl:value-of select="name/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.2055%; height: 21px;">Contact</td>
<td style="width: 79.7945%; height: 21px;"><xsl:value-of select="contact/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.2055%; height: 21px;">Notes</td>
<td style="width: 79.7945%; height: 21px;"><xsl:value-of select="deliveryAddress/notes/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.2055%; height: 21px;">Address</td>
<td style="width: 79.7945%; height: 21px;"><xsl:value-of select="deliveryAddress/address/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.2055%; height: 21px;">Postal Code</td>
<td style="width: 79.7945%; height: 21px;"><xsl:value-of select="deliveryAddress/postalcode/text()"/></td>
</tr>
<tr style="height: 21px;">
<td style="width: 20.2055%; height: 21px;">City</td>
<td style="width: 79.7945%; height: 21px;"><xsl:value-of select="deliveryAddress/city/text()"/></td>
</tr>
</tbody>
</table>
<p></p>
</xsl:template>

<xsl:template match="employee">\
    
<table border="1" style="border-collapse: collapse; width: 15%; height: 30px; margin-left: auto; margin-right: auto; text-align: center;">
<tbody>
<tr>
<td style="width: 100%;">Employee Details</td>
</tr>
</tbody>
</table>
<table border="1" style="border-collapse: collapse; width: 15%; height: 30px; margin-left: auto; margin-right: auto; text-align: center;">
<tbody>
<tr>
<td style="width: 20.2055%;">Employee ID</td>
<td style="width: 79.7945%;"><xsl:value-of select="employeeID/text()"/></td>
</tr>
<tr>
<td style="width: 20.2055%;">Name</td>
<td style="width: 79.7945%;"><xsl:value-of select="name/text()"/></td>
</tr>
<tr>
<td style="width: 20.2055%;">Contact</td>
<td style="width: 79.7945%;"><xsl:value-of select="contact/text()"/></td>
</tr>
</tbody>
</table>
<p></p>
</xsl:template>

<xsl:template match="payment">
    
<table border="1" style="border-collapse: collapse; width: 15%; height: 30px; margin-left: auto; margin-right: auto; text-align: center;">
<tbody>
<tr>
<td style="width: 100%;">Payment Method</td>
</tr>
</tbody>
</table>
<table border="1" style="border-collapse: collapse; width: 15%; height: 30px; margin-left: auto; margin-right: auto; text-align: center;">
<tbody>
<tr>
<td style="width: 20.5479%;">Method</td>
<td style="width: 79.4521%;"><xsl:value-of select="method/text()"/></td>
</tr>
<tr>
<td style="width: 20.5479%;">Amount Total</td>
<td style="width: 79.4521%;">PHP <xsl:value-of select="amountTotal/text()"/></td>
</tr>
<tr>
<td style="width: 20.5479%;">Delivery Charge</td>
<td style="width: 79.4521%;">PHP <xsl:value-of select="deliveryCharge/text()"/></td>
</tr>
</tbody>
</table>
</xsl:template>

</xsl:stylesheet>
