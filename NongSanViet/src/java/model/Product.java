package model;

import java.io.Serializable;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String name;
    private String category;
    private String description;
    private double price;          // VNĐ/kg
    private String imageUrl;
    private boolean isNew;

    // NEW: theo dữ liệu bạn nhập
    private double quantityKg;     // số lượng (kg)
    private LocalDate harvestDate; // ngày thu hoạch

    // giữ lại để không phá UI cũ (nếu có)
    private int discount;
    private double rating;
    private int soldCount;

    public Product() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    // JavaBeans-friendly
    public boolean isNew() { return isNew; }
    public void setNew(boolean isNew) { this.isNew = isNew; }

    // tương thích code cũ của bạn
    public boolean isIsNew() { return isNew; }
    public void setIsNew(boolean isNew) { this.isNew = isNew; }

    public double getQuantityKg() { return quantityKg; }
    public void setQuantityKg(double quantityKg) { this.quantityKg = quantityKg; }

    public LocalDate getHarvestDate() { return harvestDate; }
    public void setHarvestDate(LocalDate harvestDate) { this.harvestDate = harvestDate; }

    public int getDiscount() { return discount; }
    public void setDiscount(int discount) { this.discount = discount; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public int getSoldCount() { return soldCount; }
    public void setSoldCount(int soldCount) { this.soldCount = soldCount; }

    // helper format
    public String getFormattedPricePerKg() {
        NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
        return nf.format(price) + " ₫/kg";
    }

    public String getFormattedQuantityKg() {
        NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
        return nf.format(quantityKg) + " kg";
    }

    public String getFormattedHarvestDate() {
        if (harvestDate == null) return "";
        return harvestDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }
}