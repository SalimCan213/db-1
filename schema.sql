create table brands
(
    id         bigint unsigned auto_increment
        primary key,
    name       varchar(255) not null,
    logo       varchar(255) null,
    created_at timestamp    null,
    updated_at timestamp    null,
    constraint brands_name_unique
        unique (name)
)
    collate = utf8mb4_unicode_ci;

create table cache
(
    `key`      varchar(255) not null
        primary key,
    value      mediumtext   not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table cache_locks
(
    `key`      varchar(255) not null
        primary key,
    owner      varchar(255) not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table categories
(
    id            bigint unsigned auto_increment
        primary key,
    category_name varchar(255) not null,
    created_at    timestamp    null,
    updated_at    timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table failed_jobs
(
    id         bigint unsigned auto_increment
        primary key,
    uuid       varchar(255)                          not null,
    connection text                                  not null,
    queue      text                                  not null,
    payload    longtext                              not null,
    exception  longtext                              not null,
    failed_at  timestamp default current_timestamp() not null,
    constraint failed_jobs_uuid_unique
        unique (uuid)
)
    collate = utf8mb4_unicode_ci;

create table job_batches
(
    id             varchar(255) not null
        primary key,
    name           varchar(255) not null,
    total_jobs     int          not null,
    pending_jobs   int          not null,
    failed_jobs    int          not null,
    failed_job_ids longtext     not null,
    options        mediumtext   null,
    cancelled_at   int          null,
    created_at     int          not null,
    finished_at    int          null
)
    collate = utf8mb4_unicode_ci;

create table jobs
(
    id           bigint unsigned auto_increment
        primary key,
    queue        varchar(255)     not null,
    payload      longtext         not null,
    attempts     tinyint unsigned not null,
    reserved_at  int unsigned     null,
    available_at int unsigned     not null,
    created_at   int unsigned     not null
)
    collate = utf8mb4_unicode_ci;

create index jobs_queue_index
    on jobs (queue);

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table models
(
    id         bigint unsigned auto_increment
        primary key,
    brand_id   bigint unsigned not null,
    model_name varchar(255)    not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint models_brand_id_foreign
        foreign key (brand_id) references brands (id)
)
    collate = utf8mb4_unicode_ci;

create table password_reset_tokens
(
    email      varchar(255) not null
        primary key,
    token      varchar(255) not null,
    created_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table products
(
    id          bigint unsigned auto_increment
        primary key,
    title       varchar(255)    null,
    description longtext        null,
    image       varchar(255)    null,
    category    varchar(255)    null,
    created_at  timestamp       null,
    updated_at  timestamp       null,
    brand_id    bigint unsigned null,
    constraint products_brand_id_foreign
        foreign key (brand_id) references brands (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table images
(
    id         bigint unsigned auto_increment
        primary key,
    product_id bigint unsigned not null,
    url        varchar(255)    not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint images_product_id_foreign
        foreign key (product_id) references products (id)
)
    collate = utf8mb4_unicode_ci;

create table sessions
(
    id            varchar(255)    not null
        primary key,
    user_id       bigint unsigned null,
    ip_address    varchar(45)     null,
    user_agent    text            null,
    payload       longtext        not null,
    last_activity int             not null
)
    collate = utf8mb4_unicode_ci;

create index sessions_last_activity_index
    on sessions (last_activity);

create index sessions_user_id_index
    on sessions (user_id);

create table users
(
    id                bigint unsigned auto_increment
        primary key,
    name              varchar(255)                not null,
    email             varchar(255)                not null,
    usertype          varchar(255) default 'user' not null,
    email_verified_at timestamp                   null,
    password          varchar(255)                not null,
    remember_token    varchar(100)                null,
    created_at        timestamp                   null,
    updated_at        timestamp                   null,
    constraint users_email_unique
        unique (email)
)
    collate = utf8mb4_unicode_ci;

create table favorites
(
    id         bigint unsigned auto_increment
        primary key,
    user_id    bigint unsigned not null,
    product_id bigint unsigned not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint favorites_product_id_foreign
        foreign key (product_id) references products (id)
            on update cascade,
    constraint favorites_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table reviews
(
    id         bigint unsigned auto_increment
        primary key,
    product_id bigint unsigned not null,
    user_id    bigint unsigned not null,
    comment    text            not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint reviews_product_id_foreign
        foreign key (product_id) references products (id),
    constraint reviews_user_id_foreign
        foreign key (user_id) references users (id)
)
    collate = utf8mb4_unicode_ci;

create table votes
(
    id         bigint unsigned auto_increment
        primary key,
    user_id    bigint unsigned not null,
    review_id  bigint unsigned not null,
    product_id bigint unsigned not null,
    vote       int             not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    constraint votes_product_id_foreign
        foreign key (product_id) references products (id),
    constraint votes_review_id_foreign
        foreign key (review_id) references reviews (id),
    constraint votes_user_id_foreign
        foreign key (user_id) references users (id)
)
    collate = utf8mb4_unicode_ci;


