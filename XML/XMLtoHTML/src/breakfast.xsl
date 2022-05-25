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
                <body>
                    <table border="1">
                      <tr bgcolor="#9acd32">
                        <th>Title</th>
                        <th>Author</th>
                        <th>Category</th>
                        <th>Year</th>
                        <th>Price</th>
                      </tr>
                      <xsl:for-each select="bookstore/book">
                      <xsl:sort select="author"/>
                      <tr>
                        <td><xsl:value-of select="title"/></td>
                        <td><xsl:value-of select="author"/></td>
                        <td><xsl:value-of select="category"/></td>
                        <td><xsl:value-of select="year"/></td>
                        <td><xsl:value-of select="price"/></td>
                      </tr>
                      </xsl:for-each>

                    </table>
                </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

