# МОДУЛИ

# Модуль 2: Базы данных и SQL

url: https://github.com/Data-Learn/data-engineering/blob/master/DE-101%20Modules/Module02/readme.md

## 2.2: Что такое базы данных и как они помогают при работе с данными

### Практика:
1. Вам необходимо установить Postgres базу данных к себе на компьютер.

### Выполнение:
Установил, выполнен запрос версии Postgres((https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.3/HW_2.2_PostgreSQL_version.png)


## 2.3: Подключение к Базам Данных и SQL

### Практика:
1. Вам необходимо установить клиент SQL для подключения базы данных. Вы можете посмотреть инструкции по установки DBeaver. Так же вы можете использовать любой другой клиент для подключения к ваше БД.
2. Создайте 3 таблицы и загрузите данные из Superstore Excel файл в вашу базу данных. Сохраните в вашем GitHub скрипт загрузки данных и создания таблиц.
3. Напишите запросы, указанные ниже. Сохраните в вашем GitHub скрипт загрузки данных и создания таблиц.
Cоздания запросов:
- Total Profit;
- Profit Ratio;
- Profit per Order;
- Sales per Customer;
- Avg. Discount;
- Monthly Sales by Segment;
- Monthly Sales by Product Category;

- Sales by Product Category over time;

- Sales and Profit by Customer;
- Customer Ranking;
- Sales per region.


### Выполнение:
1. [Тест соединения с БД](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.3/HW_2.3_PostgreSQL_DBeaver.png)
2. Файл [Sample - Superstore.xls](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.3/Sample%20-%20Superstore.xls) состоит из 3 таблиц, для иморта через DBeaver сохранил каждую таблицу отдельно в [1](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.3/Sample%20-%20Superstore%201tb.csv), [2](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.3/Sample%20-%20Superstore%202tb.csv), [3](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.3/Sample%20-%20Superstore%203tb.csv) CSV файлы. Закгрузил CSV файлы в [DBeaver](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.3/HW_2.3_Import_CSV_DBeaver.png)
Поменял символ с запятой на точку в столбцах где указаны деньги. Столбцам с датами и деньгами поменял тип данных на Date и и Money.  
3. [HW_2.3_script_request.sql](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.3/HW_2.3_script_request.sql)

## 2.4: Модели Данных

### Практика:
1. Вам необходимо нарисовать модель данных для нашего файлика Superstore:
- Концептуальную;
- Логическую;
- Физическую  

Вы можете использовать бесплатную версию [SqlDBM](https://sqldbm.com/Home/) или любой другой софт для создания моделей данных баз данных.

2. Когда вы нарисуете модель данных, вам нужно скопировать DDL и выполнить его в SQL клиенте.
3. Вам необходимо сделать INSERT INTO SQL, чтобы заполнить Dimensions таблицы и Sales Fact таблицу. Сначала мы заполняем Dimensions таблицы, где в качестве id мы генерим последовательность чисел, а зачем Sales Fact таблицу, в которую вставляем id из Dimensions таблиц. Такой пример я рассматривал в видео.

### Выполнение:
1. Модель данных реализована в [sqldbm.com](https://app.sqldbm.com/):
- [Концептуальная](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.4/HW_2.4_%D0%BA%D0%BE%D0%BD%D1%86%D0%B5%D0%BF%D1%82%D1%83%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F_%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C_%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85.png)
- [Логическая](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.4/HW_2.4_%D0%BB%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F_%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C_%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85.png) 
- [Физическая](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.4/HW_2.4_%D1%84%D0%B8%D0%B7%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F_%D0%BC%D0%BE%D0%B4%D0%B5%D0%BB%D1%8C_%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85.png)

2. В [SQL скрипте](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.4/HW_2.4_SQL.sql) указаны после комментария "DLL командаы"
3. В [SQL скрипте](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.4/HW_2.4_SQL.sql) указаны после комментарии "Наполнение таблиц" 

## 2.5: База данных в облаке

### Практика:
1. Вам необходимо создать учетную запись в AWS. Это бесплатно. Если вы запускаете сервис в AWS, не забудьте его удалить, когда он не нужен, а то могут и денюшку списать.
2. Используя сервис AWS Lightsail или AWS RDS (смотрите инструкцию) создайте БД Postgres и активируйте Public access
3. Подключитесь к новой БД через SQL клиент (например DBeaver)
4. Загрузите данные из модуля 2.3 (Superstore dataset) в staging (схема БД stg) и загрузите dimensional model (схема dw). Вы можете использовать мой пример SQL для этого упражнения:

- Staging stg.orders.sql
- Business Layer from_stg_to_dw.sql

5. Попробуйте выполнить свои запросы из предыдущих упражнений. Не забудьте указать схему перед название таблицы. Например, public.orders или stg.orders

### Выполнение:
1. Учетную запись создал
2. Создал AWS RDS (публичный доступ)
3. В настройках В VPC security groups изменил(дополнил) Правила входящего трафика. Подключился к БД через DBeaver.ё
4. Использовал скрипты 

- stg.orders.sql (созджание "сырой" среды для дальнейшей работы с данными)
- from_stg_to_dw.sql (выгрузка из STG в DWH для предметной работы с данными для бизнеса)

5. Запросы:

- Total Profit;
- Profit Ratio;
- Profit per Order;
- Sales per Customer;
- Avg. Discount;
- Monthly Sales by Segment;
- Monthly Sales by Product Category;

- Sales by Product Category over time;

- Sales and Profit by Customer;
- Customer Ranking;
- Sales per region.

Скрипты [dw.orders](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.5/dw.orders.sql), [stg.orders](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.5/stg.orders.sql)

## 2.6: Как донести данные до бизнес-пользователя (Пример решений на KlipFolio, Google Sheets и пр.)

### Практика:
1. Вам необходимо создать дашборд в одном из решений. Для идей можно использовать задание из 1го модуля. Данные должны быть в Postgres в AWS и вы сможете подключиться сервисом к БД и создать несколько отчетов. Для практики можно и во всех 3х создать.

### Выполнение:
1. Дашбор выбран [LookerStudio](https://lookerstudio.google.com/). Создан connect между [Postgres в AWS и LookerStudio](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.6/HW_2.5_connect_AWS_BI.png).
Создан [отчет](https://github.com/ZoooMX/DataLearn/blob/main/DE-101/Module_02/2.6/HW_2.5_BI_lookerstudio.png) на основе данных из Postgres в AWS.

