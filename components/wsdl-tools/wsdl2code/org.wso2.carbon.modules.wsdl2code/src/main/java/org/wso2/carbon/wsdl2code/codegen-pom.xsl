<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="info"/>
    </xsl:template>

    <xsl:template match="info">

        <xsl:variable name="name" select="name"/>
        <xsl:variable name="isBuildXml" select="isBuildXml"/>
        <xsl:variable name="version" select="version"/>

        <project xmlns="http://maven.apache.org/POM/4.0.0"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
            <modelVersion>4.0.0</modelVersion>
            <groupId>org.wso2.wsas.sdk</groupId>
            <artifactId><xsl:value-of select="generate-id()"/>-<xsl:value-of select="$name"/>
            </artifactId>
            <packaging>jar</packaging>
            <version>
                <xsl:value-of select="$version"/>
            </version>
            <name>WSDL2Java Generated Artifact</name>
            <description>This pom.xml was auto-generated by the WSAS WSDL2Code tool. You could customize it to meet your
                requirements.
            </description>
            <url>http://www.wso2.org</url>

            <build>
                <sourceDirectory>src</sourceDirectory>
                <testSourceDirectory>test</testSourceDirectory>
                <resources>
                    <resource>
                        <directory>resources</directory>
                    </resource>
                </resources>
                <defaultGoal>install</defaultGoal>
                <plugins>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-compiler-plugin</artifactId>
                        <version>2.0</version>
                        <configuration>
                            <source>1.5</source>
                            <target>1.5</target>
                        </configuration>
                    </plugin>

                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-surefire-plugin</artifactId>
                        <version>2.2</version>
                    </plugin>

                    <xsl:if test="$isBuildXml='true'">
                        <plugin>
                            <groupId>org.apache.maven.plugins</groupId>
                            <artifactId>maven-antrun-plugin</artifactId>
                            <executions>
                                <execution>
                                    <id>run-build-xml</id>
                                    <phase>package</phase>
                                    <configuration>
                                        <tasks>
                                            <ant antfile="build.xml" inheritRefs="true">
                                                <property name="axis2.home" value="target"/>
                                                <property name="build" value="target/build"/>
                                                <property name="maven.class.path" refid="maven.compile.classpath"/>
                                            </ant>
                                        </tasks>
                                    </configuration>
                                    <goals>
                                        <goal>run</goal>
                                    </goals>
                                </execution>
                            </executions>
                        </plugin>
                    </xsl:if>
                </plugins>
            </build>

            <dependencies>
                <xsl:comment>Axis2 Jars</xsl:comment>
                <dependency>
                    <groupId>org.apache.axis2.wso2</groupId>
                    <artifactId>axis2</artifactId>
                    <version>${axis2.version.wso2}</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.axis2.wso2</groupId>
                    <artifactId>axis2-jibx</artifactId>
                    <version>${axis2.version.wso2}</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.axis2.wso2</groupId>
                    <artifactId>axis2-jaxbri</artifactId>
                    <version>${axis2.version.wso2}</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.axis2.wso2</groupId>
                    <artifactId>axis2-json</artifactId>
                    <version>${axis2.version.wso2}</version>
                </dependency>

                <xsl:comment>AIOM Dependencies</xsl:comment>
                <dependency>
                    <groupId>org.apache.ws.commons.axiom.wso2</groupId>
                    <artifactId>axiom</artifactId>
                    <version>${axiom.version.wso2}</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.neethi</groupId>
                    <artifactId>neethi</artifactId>
                    <version>2.0.4</version>
                </dependency>

                <dependency>
                    <groupId>commons-logging</groupId>
                    <artifactId>commons-logging</artifactId>
                    <version>1.1.1</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.logging.log4j</groupId>
                    <artifactId>log4j-core</artifactId>
                    <version>2.17.1</version>
                </dependency>

                <dependency>
                    <groupId>commons-httpclient</groupId>
                    <artifactId>commons-httpclient</artifactId>
                    <version>3.0.1</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.httpcomponents</groupId>
                    <artifactId>httpcore</artifactId>
                    <version>4.0-alpha5</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.woden</groupId>
                    <artifactId>woden-api</artifactId>
                    <version>1.0M8</version>
                </dependency>
                <dependency>
                    <groupId>org.apache.woden</groupId>
                    <artifactId>woden-impl-dom</artifactId>
                    <version>1.0M8</version>
                </dependency>
                <dependency>
                    <groupId>wsdl4j</groupId>
                    <artifactId>wsdl4j</artifactId>
                    <version>1.6.2-wso2v3</version>
                </dependency>
                <dependency>
                    <groupId>javax.mail</groupId>
                    <artifactId>mail</artifactId>
                    <version>1.4</version>
                </dependency>

                <dependency>
                    <groupId>xmlbeans</groupId>
                    <artifactId>xbean</artifactId>
                    <version>2.1.0</version>
                </dependency>

                <dependency>
                    <groupId>junit</groupId>
                    <artifactId>junit</artifactId>
                    <version>3.8.2</version>
                    <scope>test</scope>
                </dependency>

                <dependency>
                    <groupId>org.apache.ws.commons.schema</groupId>
                    <artifactId>XmlSchema</artifactId>
                    <version>1.4.7</version>
                </dependency>
                <xsl:comment>XMLBeans</xsl:comment>
                <dependency>
                    <groupId>org.apache.ant</groupId>
                    <artifactId>ant-nodeps</artifactId>
                    <version>1.7.0</version>
                </dependency>

                <dependency>
                    <groupId>xalan</groupId>
                    <artifactId>xalan</artifactId>
                    <version>2.7.0</version>
                </dependency>

                <dependency>
                    <groupId>stax</groupId>
                    <artifactId>stax-api</artifactId>
                    <version>1.0.1</version>
                </dependency>

                <dependency>
                    <groupId>org.codehaus.woodstox</groupId>
                    <artifactId>wstx-asl</artifactId>
                    <version>3.2.1</version>
                </dependency>

                <dependency>
                    <groupId>backport-util-concurrent</groupId>
                    <artifactId>backport-util-concurrent</artifactId>
                    <version>2.1</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.derby</groupId>
                    <artifactId>derby</artifactId>
                    <version>10.3.2.1</version>
                </dependency>

                <dependency>
                    <groupId>org.hibernate</groupId>
                    <artifactId>hibernate</artifactId>
                    <version>3.1.3</version>
                    <exclusions>
                        <exclusion>
                            <groupId>javax.transaction</groupId>
                            <artifactId>jta</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>

                <dependency>
                    <groupId>geronimo-spec</groupId>
                    <artifactId>geronimo-spec-jta</artifactId>
                    <version>1.0.1B-rc4</version>
                </dependency>

                <dependency>
                    <groupId>dom4j</groupId>
                    <artifactId>dom4j</artifactId>
                    <version>1.6</version>
                </dependency>

                <dependency>
                    <groupId>commons-codec</groupId>
                    <artifactId>commons-codec</artifactId>
                    <version>1.3</version>
                </dependency>

                <dependency>
                    <groupId>commons-fileupload</groupId>
                    <artifactId>commons-fileupload</artifactId>
                    <version>1.1.1</version>
                </dependency>

                <dependency>
                    <groupId>org.apache.sandesha2</groupId>
                    <artifactId>sandesha2</artifactId>
                    <version>${sandesha.version}</version>
                    <type>mar</type>
                </dependency>

                <dependency>
                    <groupId>org.apache.sandesha2</groupId>
                    <artifactId>sandesha2-policy</artifactId>
                    <version>${sandesha.version}</version>
                    <exclusions>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-kernel</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-mtompolicy</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>

                <dependency>
                    <groupId>org.apache.sandesha2</groupId>
                    <artifactId>sandesha2-client-constants</artifactId>
                    <version>${sandesha.version}</version>
                    <exclusions>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-kernel</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-mtompolicy</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>

                <dependency>
                    <groupId>org.apache.sandesha2</groupId>
                    <artifactId>sandesha2-core</artifactId>
                    <version>${sandesha.version}</version>
                    <exclusions>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-kernel</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-mtompolicy</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>

                <dependency>
                    <groupId>org.apache.rampart</groupId>
                    <artifactId>rampart-policy</artifactId>
                    <version>${rampart.version}</version>
                    <exclusions>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-kernel</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-xmlbeans</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-mtompolicy</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>httpcomponents-httpcore</groupId>
                            <artifactId>jakarta-httpcore</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.neethi</groupId>
                            <artifactId>neethi</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>
                <dependency>
                    <groupId>org.apache.rampart</groupId>
                    <artifactId>rampart-trust</artifactId>
                    <version>${rampart.version}</version>
                    <exclusions>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-kernel</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-xmlbeans</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-mtompolicy</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>httpcomponents-httpcore</groupId>
                            <artifactId>jakarta-httpcore</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.neethi</groupId>
                            <artifactId>neethi</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>
                <dependency>
                    <groupId>org.apache.rampart</groupId>
                    <artifactId>rampart-core</artifactId>
                    <version>${rampart.version}</version>
                    <exclusions>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-kernel</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-xmlbeans</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-mtompolicy</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>httpcomponents-httpcore</groupId>
                            <artifactId>jakarta-httpcore</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.neethi</groupId>
                            <artifactId>neethi</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>

                <dependency>
                    <groupId>org.apache.rampart</groupId>
                    <artifactId>rampart</artifactId>
                    <version>${rampart.version}</version>
                    <type>mar</type>
                    <exclusions>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-kernel</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-xmlbeans</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-mtompolicy</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>httpcomponents-httpcore</groupId>
                            <artifactId>jakarta-httpcore</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.neethi</groupId>
                            <artifactId>neethi</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>

                <dependency>
                    <groupId>org.apache.rampart</groupId>
                    <artifactId>rahas</artifactId>
                    <version>1.4</version>
                    <type>mar</type>
                    <exclusions>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-kernel</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-xmlbeans</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb-codegen</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-adb</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.axis2</groupId>
                            <artifactId>axis2-mtompolicy</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>httpcomponents-httpcore</groupId>
                            <artifactId>jakarta-httpcore</artifactId>
                        </exclusion>
                        <exclusion>
                            <groupId>org.apache.neethi</groupId>
                            <artifactId>neethi</artifactId>
                        </exclusion>
                    </exclusions>
                </dependency>
            </dependencies>

            <properties>
                <axis2.version.wso2>1.6.1.wso2v6</axis2.version.wso2>
                <axiom.version.wso2>1.2.11.wso2v2</axiom.version.wso2>
                <sandesha.version>1.6.1-wso2v1</sandesha.version>
                <rampart.version>1.6.1-wso2v4</rampart.version>
            </properties>

            <profiles>
                <profile>
                    <id>jdk14</id>
                    <activation>
                        <activeByDefault>true</activeByDefault>
                        <jdk>1.4</jdk>
                    </activation>
                    <dependencies>
                        <dependency>
                            <groupId>bouncycastle</groupId>
                            <artifactId>bcprov-jdk13</artifactId>
                            <version>132</version>
                            <scope>compile</scope>
                        </dependency>
                    </dependencies>
                </profile>

                <profile>
                    <id>jdk15</id>
                    <activation>
                        <jdk>1.5</jdk>
                    </activation>
                    <dependencies>
                        <dependency>
                            <groupId>bouncycastle</groupId>
                            <artifactId>bcprov-jdk15</artifactId>
                            <version>132</version>
                            <scope>compile</scope>
                        </dependency>
                    </dependencies>
                </profile>
            </profiles>

            <repositories>
                <repository>
                    <id>maven-snapshots</id>
                    <name>Maven Central Development Repository</name>
                    <url>http://snapshots.maven.codehaus.org/maven2</url>
                    <releases>
                        <enabled>false</enabled>
                    </releases>
                </repository>
                <repository>
                    <id>m2-snapshot-repository</id>
                    <url>http://people.apache.org/repo/m2-snapshot-repository</url>
                    <releases>
                        <enabled>false</enabled>
                    </releases>
                    <snapshots>
                        <enabled>true</enabled>
                    </snapshots>
                </repository>
                <repository>
                    <id>wso2-maven2-repository</id>
                    <url>http://maven.wso2.org/nexus/content/repositories/releases/</url>
                </repository>
                <repository>
                    <id>wso2-maven2-repository-nexus</id>
                    <url>http://maven.wso2.org/nexus/content/groups/wso2-public</url>
                </repository>
            </repositories>

            <pluginRepositories>
                <pluginRepository>
                    <id>snapshot-apache</id>
                    <name>Apache Snapshot repository</name>
                    <url>http://people.apache.org/repo/m2-snapshot-repository</url>
                    <snapshots>
                        <enabled>true</enabled>
                    </snapshots>
                    <releases>
                        <enabled>false</enabled>
                    </releases>
                </pluginRepository>

                <pluginRepository>
                    <id>snapshot</id>
                    <name>Snapshot repository</name>
                    <url>http://snapshots.maven.codehaus.org/maven2</url>
                    <snapshots>
                        <enabled>true</enabled>
                    </snapshots>
                    <releases>
                        <enabled>false</enabled>
                    </releases>
                </pluginRepository>

            </pluginRepositories>
        </project>


    </xsl:template>

</xsl:stylesheet>
