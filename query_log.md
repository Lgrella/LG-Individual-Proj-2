```sql
INSERT INTO alcbycountry (country, beer_servings, spirit_servings, wine_servings, total_liters) VALUES ('TEST', 10, 20, 0, 15);
```

```sql
SELECT * FROM alcbycountry WHERE country = 'belize';
```

```sql
DELETE FROM alcbycountry WHERE id=3;
```

```sql
UPDATE alcbycountry SET country='Afghanistan', beer_servings=100, spirit_servings=30, wine_servings = 1, total_liters=15 WHERE id=1;
```

```sql
SELECT * from alcbycountry
```

