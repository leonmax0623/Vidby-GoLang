## Сервер

Возможны конфликты старой и новой версии схем для базы данных. Если при запуске API будут сообщения Failed to
automigrate database, то можете просто удалить все базу данных целиком, там никакой важной информации нет

После того как все запуститься нужно будет создать root юзера и добавить языки. Вот SQL:

**Первая**

    INSERT INTO public.users (id, created_at, updated_at, deleted_at, email, password, role, name)
    VALUES (0::bigint, '2022-07-06 12:38:03.737000 +00:00'::timestamp with time zone,
        '2022-07-12 15:43:42.256000 +00:00'::timestamp with time zone, null::timestamp with time zone,
        'root@gmail.com'::text, '$2a$14$8dYloh8QAjc7KHDEYAXwUegMHiFH8.J72fzIPo10yPINcAyk.CW2C'::text, 1::bigint,
        'root account '::text);

**Вторая**


    INSERT INTO public.user_roles (id, created_at, updated_at, deleted_at, user_ids, permissions, name, created_by_id, updated_by_id, hierarchy)
    VALUES (1, '2022-07-06 12:29:40.171000 +00:00',
        '2022-07-15 16:14:31.310000 +00:00', null, '{}',
        '{users/read,users/write,languages/read,languages/write,main-content/read,main-content/write,landing-content/read,landing-content/write,emails/read,roles/read,roles/write,content-custom-scripts/read,content-custom-scripts/write}', 'Root', 0, 0, 0);
        
        
        
**Третья** 

    INSERT INTO public.website_languages (id, created_at, updated_at, deleted_at, code, language, available)
    VALUES (DEFAULT, '2022-06-12 18:48:45.705289 +00:00', '2022-06-23 08:20:56.777908 +00:00', null, 'de', 'Germany', true);

    INSERT INTO public.website_languages (id, created_at, updated_at, deleted_at, code, language, available)
    VALUES (DEFAULT, '2022-05-29 12:36:54.081000 +00:00', '2022-05-31 08:54:47.857776 +00:00', null, 'en', 'English', true);
