#!/usr/bin/env bash

SCALASTYLE_JAR=scalastyle_2.11-1.0.0-batch.jar
SCALASTYLE_URL=https://oss.sonatype.org/content/repositories/releases/org/scalastyle/scalastyle_2.11/1.0.0/$SCALASTYLE_JAR
SCALASTYLE_DIR=/opt/scalastyle
SCALASTYLE_PATH=$SCALASTYLE_DIR/$SCALASTYLE_JAR
SCALASTYLE_COMMAND="java -jar $SCALASTYLE_PATH '\$@'"
SCALASTYLE_SCRIPT=/usr/bin/scalastyle

mkdir /opt/scalastyle
wget -O /opt/scalastyle/$SCALASTYLE_JAR $SCALASTYLE_URL

cat > $SCALASTYLE_SCRIPT <<EOF
#/usr/bin/env bash
$SCALASTYLE_COMMAND
EOF

chmod +x $SCALASTYLE_SCRIPT
