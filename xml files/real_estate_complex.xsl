<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:r="http://www.example.com/real_estate_complex" version="1.0">

  <xsl:template match="/">
    <html>
      <head>
        <title>Real Estate</title>
      </head>
      <body>
        <h2>Real Estate</h2>
        <table border="1">
          <tr>
            <th>ID</th>
            <th>Street</th>
            <th>City</th>
            <th>Zipcode</th>
            <th>Price</th>
            <th>Type</th>
            <th>Bedrooms</th>
            <th>Bathrooms</th>
            <th>Garage</th>
          </tr>
          <xsl:for-each select="//r:property">
            <xsl:sort select="r:price" order="ascending"/>
            <xsl:if test="r:price &lt;= 750000">
              <tr>
                <td><xsl:value-of select="@id"/></td>
                <td><xsl:value-of select="r:address/r:street"/></td>
                <td><xsl:value-of select="r:address/r:city"/></td>
                <td><xsl:value-of select="r:address/r:zipcode"/></td>
                <td><xsl:value-of select="r:price"/> <xsl:value-of select="r:price/@currency"/></td>
                <td><xsl:value-of select="r:type"/></td>
                <td><xsl:value-of select="r:features/r:bedrooms"/></td>
                <td><xsl:value-of select="r:features/r:bathrooms"/></td>
                <td><xsl:if test="r:features/r:garage='true'">Yes</xsl:if></td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
