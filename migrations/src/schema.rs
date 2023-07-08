// SPDX-FileCopyrightText: 2023 perillamint <perillamint@silicon.moe>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

// @generated automatically by Diesel CLI.

diesel::table! {
    servers (id) {
        id -> Uuid,
        webfinger -> Nullable<Text>,
        authority -> Nullable<Text>,
        created_at -> Nullable<Timestamptz>,
        updated_at -> Nullable<Timestamptz>,
    }
}

diesel::table! {
    tag_server_bridge (id) {
        id -> Uuid,
        tag_id -> Nullable<Uuid>,
        server_id -> Nullable<Uuid>,
        created_at -> Nullable<Timestamptz>,
        updated_at -> Nullable<Timestamptz>,
    }
}

diesel::table! {
    tags (id) {
        id -> Uuid,
        tag -> Nullable<Text>,
        created_at -> Nullable<Timestamptz>,
        updated_at -> Nullable<Timestamptz>,
    }
}

diesel::table! {
    user_idp (id) {
        id -> Uuid,
        user_id -> Nullable<Uuid>,
        idp -> Nullable<Text>,
        idp_id -> Nullable<Text>,
        created_at -> Nullable<Timestamptz>,
        updated_at -> Nullable<Timestamptz>,
    }
}

diesel::table! {
    users (id) {
        id -> Uuid,
        email -> Nullable<Text>,
        permission -> Nullable<Jsonb>,
        created_at -> Nullable<Timestamptz>,
        updated_at -> Nullable<Timestamptz>,
    }
}

diesel::joinable!(tag_server_bridge -> servers (server_id));
diesel::joinable!(tag_server_bridge -> tags (tag_id));
diesel::joinable!(user_idp -> users (user_id));

diesel::allow_tables_to_appear_in_same_query!(
    servers,
    tag_server_bridge,
    tags,
    user_idp,
    users,
);
