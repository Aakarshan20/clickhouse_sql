CREATE TABLE t_stock
(
    `id` UInt32,
    `sku_id` String,
    `total_amount` Decimal(16, 2),
    `create_time` Datetime
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(create_time)
PRIMARY KEY id
ORDER BY (id, sku_id);


insert into t_stock values
(101,'sku_002',2000.00,'2020-06-01 11:00:00'),
(102,'sku_004',2500.00,'2020-06-01 12:00:00'),
(103,'sku_002',2000.00,'2020-06-02 13:00:00'),
(104,'sku_002',12000.00,'2020-06-03 13:00:00'),
(105,'sku_002',600.00,'2020-06-04 12:00:00');



/* 手動合併表格 內存data 刷到hd*/
optimize table t_stock final;



