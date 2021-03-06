CREATE TABLE IF NOT EXISTS "FLOW"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "DESCRIPTION" TEXT(0) COMMENT 'description',
    "DRIVER_MEMORY" VARCHAR(255) COMMENT 'driverMemory',
    "EXECUTOR_CORES" VARCHAR(255) COMMENT 'executorCores',
    "EXECUTOR_MEMORY" VARCHAR(255) COMMENT 'executorMemory',
    "EXECUTOR_NUMBER" VARCHAR(255) COMMENT 'executorNumber',
    "IS_EXAMPLE" BIT COMMENT 'isExample',
    "NAME" VARCHAR(255) COMMENT 'flow name',
    "UUID" VARCHAR(255) COMMENT 'flow uuid'
);

CREATE TABLE IF NOT EXISTS "FLOW_INFO"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "END_TIME" DATETIME,
    "NAME" VARCHAR(255),
    "PROGRESS" VARCHAR(255),
    "START_TIME" DATETIME,
    "STATE" VARCHAR(255),
    "FK_FLOW_ID" VARCHAR(40)
);
ALTER TABLE `FLOW_INFO` ADD CONSTRAINT `FKdjb71fwj4i1m5cvijp2ayykkh` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_PATH"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "LINE_FROM" VARCHAR(255) COMMENT 'line from',
    "LINE_INPORT" VARCHAR(255) COMMENT 'line in port',
    "LINE_OUTPORT" VARCHAR(255) COMMENT 'line out port',
    "PAGE_ID" VARCHAR(255),
    "LINE_TO" VARCHAR(255) COMMENT 'line to',
    "FK_FLOW_ID" VARCHAR(40)
);
ALTER TABLE `FLOW_PATH` ADD CONSTRAINT `FK33rp96r4290eonsirbwrp8h0f` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_PROCESS"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "APP_ID" VARCHAR(255) COMMENT 'The id returned when calling runProcess',
    "DESCRIPTION" VARCHAR(1024) COMMENT 'description',
    "DRIVER_MEMORY" VARCHAR(255),
    "END_TIME" DATETIME COMMENT 'End time of the process',
    "EXECUTOR_CORES" VARCHAR(255),
    "EXECUTOR_MEMORY" VARCHAR(255),
    "EXECUTOR_NUMBER" VARCHAR(255),
    "FLOW_ID" VARCHAR(255) COMMENT 'flowId',
    "NAME" VARCHAR(255) COMMENT 'Process name',
    "PARENT_PROCESS_ID" VARCHAR(255) COMMENT 'third parentProcessId',
    "PROCESS_ID" VARCHAR(255) COMMENT 'third processId',
    "PROGRESS" VARCHAR(255) COMMENT 'Process progress',
    "START_TIME" DATETIME COMMENT 'Process startup time',
    "STATE" VARCHAR(255) COMMENT 'Process status',
    "VIEW_XML" TEXT COMMENT 'Process view xml string',
);

CREATE TABLE IF NOT EXISTS "FLOW_PROCESS_PATH"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "LINE_FROM" VARCHAR(255),
    "LINE_INPORT" VARCHAR(255),
    "LINE_OUTPORT" VARCHAR(255),
    "PAGE_ID" VARCHAR(255),
    "LINE_TO" VARCHAR(255),
    "FK_FLOW_PROCESS_ID" VARCHAR(40)
);
ALTER TABLE `FLOW_PROCESS_PATH` ADD CONSTRAINT `FKad4n0sl8j977awtec5beyrphy` FOREIGN KEY (`FK_FLOW_PROCESS_ID`) REFERENCES `FLOW_PROCESS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_PROCESS_STOP"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "BUNDEL" VARCHAR(255),
    "DESCRIPTION" VARCHAR(255),
    "END_TIME" DATETIME,
    "GROUPS" VARCHAR(255),
    "IN_PORT_TYPE" VARCHAR(255),
    "INPORTS" VARCHAR(255),
    "NAME" VARCHAR(255),
    "OUT_PORT_TYPE" VARCHAR(255),
    "OUTPORTS" VARCHAR(255),
    "OWNER" VARCHAR(255),
    "PAGE_ID" VARCHAR(255),
    "START_TIME" DATETIME,
    "STATE" VARCHAR(255),
    "FK_FLOW_PROCESS_ID" VARCHAR(40)
);
ALTER TABLE `FLOW_PROCESS_STOP` ADD CONSTRAINT `FK6rvjgxm3smnh3jjjnxnqiwl1p` FOREIGN KEY (`FK_FLOW_PROCESS_ID`) REFERENCES `FLOW_PROCESS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_PROCESS_STOP_PROPERTY"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "ALLOWABLE_VALUES" VARCHAR(255),
    "CUSTOM_VALUE" VARCHAR(255),
    "DESCRIPTION" VARCHAR(1024) COMMENT 'description',
    "DISPLAY_NAME" VARCHAR(255),
    "NAME" VARCHAR(255),
    "PROPERTY_REQUIRED" BIT,
    "PROPERTY_SENSITIVE" BIT,
    "FK_FLOW_PROCESS_STOP_ID" VARCHAR(40)
);
ALTER TABLE `FLOW_PROCESS_STOP_PROPERTY` ADD CONSTRAINT `FK6pqbouerl5dg97la1yqygj5rp` FOREIGN KEY (`FK_FLOW_PROCESS_STOP_ID`) REFERENCES `FLOW_PROCESS_STOP` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_SOTPS_GROUPS"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "GROUP_NAME" VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS "FLOW_STOPS"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "BUNDEL" VARCHAR(255),
    "DESCRIPTION" TEXT(0) COMMENT 'description',
    "GROUPS" VARCHAR(255),
    "IN_PORT_TYPE" VARCHAR(255),
    "INPORTS" VARCHAR(255),
    "IS_CHECKPOINT" BIT,
    "NAME" VARCHAR(255),
    "OUT_PORT_TYPE" VARCHAR(255),
    "OUTPORTS" VARCHAR(255),
    "OWNER" VARCHAR(255),
    "PAGE_ID" VARCHAR(255),
    "START_TIME" DATETIME,
    "STATE" VARCHAR(255),
    "STOP_TIME" DATETIME,
    "FK_FLOW_ID" VARCHAR(40)
);
ALTER TABLE `FLOW_STOPS` ADD CONSTRAINT `FK11mku3yphyjswbtwj9df79k44` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_STOPS_PROPERTY"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "ALLOWABLE_VALUES" VARCHAR(255),
    "CUSTOM_VALUE" TEXT(0) COMMENT 'custom value',
    "DESCRIPTION" TEXT(0) COMMENT 'description',
    "DISPLAY_NAME" VARCHAR(255) COMMENT 'display name',
    "IS_SELECT" BIT,
    "NAME" VARCHAR(255) COMMENT 'name',
    "PROPERTY_REQUIRED" BIT,
    "PROPERTY_SENSITIVE" BIT,
    "FK_STOPS_ID" VARCHAR(40)
);
ALTER TABLE `FLOW_STOPS_PROPERTY` ADD CONSTRAINT `FKsjcg9klyumklhkpl8408v6uuq` FOREIGN KEY (`FK_STOPS_ID`) REFERENCES `FLOW_STOPS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_STOPS_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "BUNDEL" VARCHAR(255),
    "DESCRIPTION" TEXT(0) COMMENT 'description',
    "GROUPS" VARCHAR(255),
    "IN_PORT_TYPE" VARCHAR(255),
    "INPORTS" VARCHAR(255),
    "NAME" VARCHAR(255),
    "OUT_PORT_TYPE" VARCHAR(255),
    "OUTPORTS" VARCHAR(255),
    "OWNER" VARCHAR(255),
    "STOP_GROUP" VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS "FLOW_STOPS_PROPERTY_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "ALLOWABLE_VALUES" TEXT(0) COMMENT 'default value',
    "DEFAULT_VALUE" TEXT(0) COMMENT 'default value',
    "DESCRIPTION" TEXT(0) COMMENT 'description',
    "DISPLAY_NAME" TEXT(0) COMMENT 'description',
    "NAME" VARCHAR(255),
    "PROPERTY_REQUIRED" BIT,
    "PROPERTY_SENSITIVE" BIT,
    "FK_STOPS_ID" VARCHAR(255)
);
ALTER TABLE `FLOW_STOPS_PROPERTY_TEMPLATE` ADD CONSTRAINT `FKhtnjkpgjkx21r2qf4r3q3mjr9` FOREIGN KEY (`FK_STOPS_ID`) REFERENCES `FLOW_STOPS_TEMPLATE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "FLOW_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "DESCRIPTION" VARCHAR(1024) COMMENT 'description',
    "NAME" VARCHAR(255),
    "PATH" VARCHAR(255),
    "VALUE" LONGTEXT,
    "FK_FLOW_ID" VARCHAR(40)
);
ALTER TABLE `FLOW_TEMPLATE` ADD CONSTRAINT `FKkcg573sjiknyhppuc0q62a0kj` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "ASSOCIATION_GROUPS_STOPS_TEMPLATE"(
    "GROUPS_ID" VARCHAR(40) NOT NULL,
    "STOPS_TEMPLATE_ID" VARCHAR(40) NOT NULL
);
ALTER TABLE `ASSOCIATION_GROUPS_STOPS_TEMPLATE` ADD CONSTRAINT `FK5ceurc1karlogl9ppecmkcp7e` FOREIGN KEY (`GROUPS_ID`) REFERENCES `FLOW_SOTPS_GROUPS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `ASSOCIATION_GROUPS_STOPS_TEMPLATE` ADD CONSTRAINT `FKqwv1iytgkhhgnjdvhqbskncf4` FOREIGN KEY (`STOPS_TEMPLATE_ID`) REFERENCES `FLOW_STOPS_TEMPLATE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "MX_GRAPH_MODEL"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "MX_ARROWS" VARCHAR(255),
    "MX_BACKGROUND" VARCHAR(255),
    "MX_CONNECT" VARCHAR(255),
    "MX_DX" VARCHAR(255),
    "MX_DY" VARCHAR(255),
    "MX_FOLD" VARCHAR(255),
    "MX_GRID" VARCHAR(255),
    "MX_GRIDSIZE" VARCHAR(255),
    "MX_GUIDES" VARCHAR(255),
    "MX_PAGE" VARCHAR(255),
    "MX_PAGEHEIGHT" VARCHAR(255),
    "MX_PAGESCALE" VARCHAR(255),
    "MX_PAGEWIDTH" VARCHAR(255),
    "MX_TOOLTIPS" VARCHAR(255),
    "FK_FLOW_ID" VARCHAR(40)
);
ALTER TABLE `MX_GRAPH_MODEL` ADD CONSTRAINT `FKktpy5kv5fgya1gn012g7395l9` FOREIGN KEY (`FK_FLOW_ID`) REFERENCES `FLOW` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "MX_CELL"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "MX_EDGE" VARCHAR(255),
    "MX_PAGEID" VARCHAR(255),
    "MX_PARENT" VARCHAR(255),
    "MX_SOURCE" VARCHAR(255),
    "MX_STYLE" VARCHAR(255),
    "MX_TARGET" VARCHAR(255),
    "MX_VALUE" VARCHAR(255),
    "MX_VERTEX" VARCHAR(255),
    "FK_MX_GRAPH_ID" VARCHAR(40)
);
ALTER TABLE `MX_CELL` ADD CONSTRAINT `FK4s2gnt8t7e5ok1v7r3v99pji5` FOREIGN KEY (`FK_MX_GRAPH_ID`) REFERENCES `MX_GRAPH_MODEL` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "MX_GEOMETRY"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "MX_AS" VARCHAR(255),
    "MX_HEIGHT" VARCHAR(255),
    "MX_RELATIVE" VARCHAR(255),
    "MX_WIDTH" VARCHAR(255),
    "MX_X" VARCHAR(255),
    "MX_Y" VARCHAR(255),
    "FK_MX_CELL_ID" VARCHAR(40)
);
ALTER TABLE `MX_GEOMETRY` ADD CONSTRAINT `FK6elkg2vbxxjrun0qaqaajwgfu` FOREIGN KEY (`FK_MX_CELL_ID`) REFERENCES `MX_CELL` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "STOPS_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "BUNDEL" VARCHAR(255),
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255),
    "DESCRIPTION" VARCHAR(255),
    "ENABLE_FLAG" BIT NOT NULL,
    "GROUPS" VARCHAR(255),
    "IN_PORT_TYPE" VARCHAR(255),
    "INPORTS" VARCHAR(255),
    "IS_CHECKPOINT" BIT,
    "NAME" VARCHAR(255),
    "OUT_PORT_TYPE" VARCHAR(255),
    "OUTPORTS" VARCHAR(255),
    "OWNER" VARCHAR(255),
    "PAGE_ID" VARCHAR(255),
    "VERSION" BIGINT,
    "FK_TEMPLATE_ID" VARCHAR(40)
);
ALTER TABLE `STOPS_TEMPLATE` ADD CONSTRAINT `FKn0wu7i6frf0xp2iypda50vlmh` FOREIGN KEY (`FK_TEMPLATE_ID`) REFERENCES `FLOW_TEMPLATE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "PROPERTY_TEMPLATE"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "ALLOWABLE_VALUES" VARCHAR(255),
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255),
    "CUSTOM_VALUE" VARCHAR(255),
    "DESCRIPTION" VARCHAR(1024) COMMENT 'description',
    "DISPLAY_NAME" VARCHAR(255),
    "ENABLE_FLAG" BIT NOT NULL,
    "IS_SELECT" BIT,
    "NAME" VARCHAR(255),
    "PROPERTY_REQUIRED" BIT,
    "PROPERTY_SENSITIVE" BIT,
    "VERSION" BIGINT,
    "FK_STOPS_ID" VARCHAR(40)
);
ALTER TABLE `PROPERTY_TEMPLATE` ADD CONSTRAINT `FK35p1h6w0dsmjc33eavnbuiys3` FOREIGN KEY (`FK_STOPS_ID`) REFERENCES `STOPS_TEMPLATE` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "SYS_USER"(
    "ID" VARCHAR(40) PRIMARY KEY NOT NULL,
    "CRT_DTTM" DATETIME NOT NULL,
    "CRT_USER" VARCHAR(255) NOT NULL,
    "ENABLE_FLAG" BIT NOT NULL,
    "LAST_UPDATE_DTTM" DATETIME NOT NULL,
    "LAST_UPDATE_USER" VARCHAR(255) NOT NULL,
    "VERSION" BIGINT,
    "AGE" INTEGER,
    "NAME" VARCHAR(255),
    "PASSWORD" VARCHAR(255),
    "SEX" VARCHAR(255),
    "USERNAME" VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS "SYS_ROLE"(
    "ID" INTEGER PRIMARY KEY NOT NULL,
    "ROLE" VARCHAR(255),
    "FK_SYS_USER_ID" VARCHAR(40)
);
ALTER TABLE `SYS_ROLE` ADD CONSTRAINT `FK48hlg5qgnejc4xropo99whsyt` FOREIGN KEY (`FK_SYS_USER_ID`) REFERENCES `SYS_USER` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS "STATISTICS" (
    "ID" VARCHAR(40) NOT NULL,
    "LOGIN_IP" VARCHAR(255),
    "LOGIN_TIME" DATETIME,
    "LOGIN_USER" VARCHAR(255)
);