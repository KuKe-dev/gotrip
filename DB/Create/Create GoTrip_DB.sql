CREATE TABLE "TypeOfReactions"(
    "id" BIGINT NOT NULL,
    "type_reaction" VARCHAR(50) NOT NULL
);
ALTER TABLE
    "TypeOfReactions" ADD PRIMARY KEY("id");
ALTER TABLE
    "TypeOfReactions" ADD CONSTRAINT "typeofreactions_type_reaction_unique" UNIQUE("type_reaction");
CREATE TABLE "Messages"(
    "id" BIGINT NOT NULL,
    "message" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "emisor-id" BIGINT NOT NULL,
    "receptor-id" BIGINT NOT NULL
);
ALTER TABLE
    "Messages" ADD PRIMARY KEY("id");
CREATE INDEX "messages_message_index" ON
    "Messages"("message");
ALTER TABLE
    "Messages" ADD CONSTRAINT "messages_emisor_id_unique" UNIQUE("emisor-id");
ALTER TABLE
    "Messages" ADD CONSTRAINT "messages_receptor_id_unique" UNIQUE("receptor-id");
CREATE TABLE "Reactions"(
    "id" BIGINT NOT NULL,
    "user-id" BIGINT NOT NULL,
    "post-id" BIGINT NOT NULL,
    "type_reaction-id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Reactions" ADD PRIMARY KEY("id");
ALTER TABLE
    "Reactions" ADD CONSTRAINT "reactions_user_id_unique" UNIQUE("user-id");
ALTER TABLE
    "Reactions" ADD CONSTRAINT "reactions_post_id_unique" UNIQUE("post-id");
ALTER TABLE
    "Reactions" ADD CONSTRAINT "reactions_type_reaction_id_unique" UNIQUE("type_reaction-id");
CREATE TABLE "Posts"(
    "id" BIGINT NOT NULL,
    "user-id" BIGINT NOT NULL,
    "img" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "geoCode" FLOAT[] NOT NULL,
    "created_at" DATE NOT NULL
);
ALTER TABLE
    "Posts" ADD PRIMARY KEY("id");
CREATE INDEX "posts_img_index" ON
    "Posts"("img");
CREATE INDEX "posts_description_index" ON
    "Posts"("description");
CREATE INDEX "posts_geocode_index" ON
    "Posts"("geoCode");
CREATE TABLE "Friendship"(
    "id" BIGINT NOT NULL,
    "user-id" BIGINT NOT NULL,
    "friend-id" BIGINT NOT NULL,
    "created_at" DATE NOT NULL
);
ALTER TABLE
    "Friendship" ADD PRIMARY KEY("id");
ALTER TABLE
    "Friendship" ADD CONSTRAINT "friendship_user_id_unique" UNIQUE("user-id");
ALTER TABLE
    "Friendship" ADD CONSTRAINT "friendship_friend_id_unique" UNIQUE("friend-id");
CREATE TABLE "Users"(
    "id" BIGINT NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "avatar" VARCHAR(255) NOT NULL,
    "bio" TEXT NULL,
    "created_at" DATE NOT NULL
);
ALTER TABLE
    "Users" ADD PRIMARY KEY("id");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_username_unique" UNIQUE("username");
ALTER TABLE
    "Users" ADD CONSTRAINT "users_email_unique" UNIQUE("email");
CREATE INDEX "users_password_index" ON
    "Users"("password");
CREATE INDEX "users_avatar_index" ON
    "Users"("avatar");
CREATE INDEX "users_bio_index" ON
    "Users"("bio");
ALTER TABLE
    "Reactions" ADD CONSTRAINT "reactions_type_reaction_id_foreign" FOREIGN KEY("type_reaction-id") REFERENCES "TypeOfReactions"("id");
ALTER TABLE
    "Reactions" ADD CONSTRAINT "reactions_user_id_foreign" FOREIGN KEY("user-id") REFERENCES "Users"("id");
ALTER TABLE
    "Friendship" ADD CONSTRAINT "friendship_friend_id_foreign" FOREIGN KEY("friend-id") REFERENCES "Users"("id");
ALTER TABLE
    "Posts" ADD CONSTRAINT "posts_user_id_foreign" FOREIGN KEY("user-id") REFERENCES "Users"("id");
ALTER TABLE
    "Friendship" ADD CONSTRAINT "friendship_user_id_foreign" FOREIGN KEY("user-id") REFERENCES "Users"("id");
ALTER TABLE
    "Messages" ADD CONSTRAINT "messages_receptor_id_foreign" FOREIGN KEY("receptor-id") REFERENCES "Users"("id");
ALTER TABLE
    "Messages" ADD CONSTRAINT "messages_emisor_id_foreign" FOREIGN KEY("emisor-id") REFERENCES "Users"("id");
ALTER TABLE
    "Reactions" ADD CONSTRAINT "reactions_post_id_foreign" FOREIGN KEY("post-id") REFERENCES "Posts"("id");