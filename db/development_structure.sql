CREATE TABLE "attfu_images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "parent_id" integer DEFAULT NULL, "size" integer DEFAULT NULL, "width" integer DEFAULT NULL, "height" integer DEFAULT NULL, "filename" varchar(255) DEFAULT NULL, "content_type" varchar(255) DEFAULT NULL, "thumbnail" varchar(255) DEFAULT NULL, "created_at" datetime DEFAULT NULL, "updated_at" datetime DEFAULT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
