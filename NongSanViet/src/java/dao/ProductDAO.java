package dao;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public ProductDAO() {
        System.out.println("ProductDAO initialized");
    }

    // ✅ 4 sản phẩm nổi bật = 4 sản phẩm giá cao nhất
    public List<Product> getFeaturedProducts() {
        String sql = """
                SELECT TOP 4 ProductID, ProductName, PriceVNDPerKg, QuantityKg, HarvestDate
                FROM dbo.Products
                ORDER BY PriceVNDPerKg DESC, HarvestDate DESC, ProductID DESC
                """;

        List<Product> products = new ArrayList<>();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            int idx = 0;
            while (rs.next()) {
                Product p = mapRow(rs);

                p.setCategory("TRÁI CÂY");
                p.setNew(idx < 2); // gắn tag MỚI VỀ cho 2 sp đầu (tuỳ bạn)
                p.setDescription("Thu hoạch: " + p.getFormattedHarvestDate()
                        + " • Tồn kho: " + p.getFormattedQuantityKg());

                // ảnh placeholder cho đồng bộ UI (bạn thay ảnh thật sau)
                p.setImageUrl("https://images.unsplash.com/photo-1514996937319-344454492b37?auto=format&fit=crop&w=1200&q=80");

                products.add(p);
                idx++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    // ✅ trang sản phẩm riêng: lấy tất cả sản phẩm
    public List<Product> getAllProducts() {
        String sql = """
                SELECT ProductID, ProductName, PriceVNDPerKg, QuantityKg, HarvestDate
                FROM dbo.Products
                ORDER BY ProductID ASC
                """;

        List<Product> products = new ArrayList<>();

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = mapRow(rs);

                p.setCategory("TRÁI CÂY");
                p.setDescription("Thu hoạch: " + p.getFormattedHarvestDate()
                        + " • Tồn kho: " + p.getFormattedQuantityKg());

                p.setImageUrl("https://images.unsplash.com/photo-1514996937319-344454492b37?auto=format&fit=crop&w=1200&q=80");

                products.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    // ====== Region Info record ======
public record RegionInfo(String title, String intro, java.util.List<String> productNames) {}

public RegionInfo getRegionInfo(String regionKey) {
    return switch (regionKey) {
        case "mien-bac" -> new RegionInfo(
            "Miền Bắc",
            "Với đặc trưng khí hậu bốn mùa rõ rệt, miền Bắc tự hào sở hữu những thức quà mang đậm hương vị thời tiết và thổ nhưỡng. Nổi bật nhất phải kể đến Vải thiều Lục Ngạn vỏ mỏng cùi dày, Nhãn lồng Hưng Yên ngọt lịm tiến vua, hay những trái Mận hậu, Đào bích giòn rụm mang hơi thở se lạnh của rẻo cao Tây Bắc. Đây là vùng đất của những loại nông sản mang tính mùa vụ cao, đúc kết trọn vẹn tinh hoa sương gió.",
            java.util.List.of(
                "Nhãn lồng Hưng Yên","Vải thiều Lục Ngạn","Cam sành Hàm Yên","Chuối tiêu hồng","Mận hậu Mộc Châu","Đào bích mỏ quạ"
            )
        );
        case "mien-trung" -> new RegionInfo(
            "Miền Trung (Bao gồm Tây Nguyên)",
            "Vượt lên cái nắng gió khắc nghiệt, dải đất miền Trung lại chắt chiu nuôi dưỡng nên những loại trái cây có độ ngọt đậm đà khó nơi nào sánh kịp. Tiêu biểu là những giàn Nho xanh, Táo gió mọng nước trên vùng đất cát Ninh Thuận, Thanh long mọng nước của Bình Thuận, hay những chùm Bòn bon chua ngọt thanh tao xứ Quảng. Nông sản miền Trung mang trong mình sức sống mãnh liệt và hương vị đậm đà của nắng gió ràn rạt.",
            java.util.List.of(
                "Thanh long ruột đỏ","Bơ sáp Đắk Lắk","Nho xanh Ninh Thuận","Táo gió Ninh Thuận","Dâu tây Đà Lạt","Chanh dây","Hồng giòn Đà Lạt","Bòn bon Quảng Nam"
            )
        );
        case "mien-nam" -> new RegionInfo(
            "Miền Nam (Đông Nam Bộ)",
            "Được thiên nhiên ưu ái ban tặng vùng đất đỏ bazan màu mỡ cùng khí hậu nhiệt đới ấm áp, miền Đông Nam Bộ là vùng chuyên canh của những loại cây ăn trái mang giá trị kinh tế cao. Nơi đây là thủ phủ của những vườn Sầu riêng Ri6 thơm lừng, Chôm chôm trĩu quả hay Măng cụt nức tiếng. Nông sản khu vực này luôn mang hương vị đậm đà, sản lượng lớn và hình thức bắt mắt.",
            java.util.List.of(
                "Sầu riêng Ri6","Chôm chôm nhãn","Măng cụt","Na (Mãng cầu ta)","Mãng cầu xiêm","Dưa lưới"
            )
        );
        case "mien-tay" -> new RegionInfo(
            "Miền Tây (Đồng Bằng Sông Cửu Long)",
            "Được mệnh danh là vựa trái cây lớn nhất cả nước, miền Tây trù phú được bồi đắp bởi lớp phù sa màu mỡ của dòng Mekong. Chủng loại nông sản ở đây vô cùng đa dạng và cho thu hoạch quanh năm. Nhắc đến miền Tây là nhớ ngay đến Xoài cát Hòa Lộc, Vú sữa Lò Rèn căng mọng, Bưởi da xanh thanh mát hay Quýt hồng Lai Vung rực rỡ. Trái cây miệt vườn luôn mang vị ngọt ngào, chất phác như chính tình người nơi đây.",
            java.util.List.of(
                "Xoài cát Hòa Lộc","Bưởi da xanh","Mít Thái","Dưa hấu Long An","Quýt đường","Dứa (Thơm)","Đu đủ ruột đỏ","Ổi lê Đài Loan","Sơ ri Gò Công","Vú sữa Lò Rèn"
            )
        );
        default -> null;
    };
}

public java.util.List<model.Product> getProductsByNames(java.util.List<String> names) {
    if (names == null || names.isEmpty()) return new java.util.ArrayList<>();

    String placeholders = String.join(",", java.util.Collections.nCopies(names.size(), "?"));
    String sql = "SELECT ProductID, ProductName, PriceVNDPerKg, QuantityKg, HarvestDate FROM dbo.Products WHERE ProductName IN (" + placeholders + ")";

    java.util.List<model.Product> products = new java.util.ArrayList<>();

    try (java.sql.Connection con = DBUtil.getConnection();
         java.sql.PreparedStatement ps = con.prepareStatement(sql)) {

        for (int i = 0; i < names.size(); i++) ps.setString(i + 1, names.get(i));

        try (java.sql.ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                model.Product p = new model.Product();
                p.setId(rs.getInt("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setPrice(rs.getDouble("PriceVNDPerKg"));
                p.setQuantityKg(rs.getDouble("QuantityKg"));
                java.sql.Date d = rs.getDate("HarvestDate");
                if (d != null) p.setHarvestDate(d.toLocalDate());

                p.setCategory("NÔNG SẢN");
                p.setDescription("Thu hoạch: " + p.getFormattedHarvestDate() + " • Tồn kho: " + p.getFormattedQuantityKg());
                p.setImageUrl(getImageForProduct(p.getName()));

                products.add(p);
            }
        }

        // giữ đúng thứ tự list
        java.util.Map<String, Integer> order = new java.util.HashMap<>();
        for (int i = 0; i < names.size(); i++) order.put(names.get(i), i);
        products.sort(java.util.Comparator.comparingInt(p -> order.getOrDefault(p.getName(), 999)));

    } catch (Exception e) {
        e.printStackTrace();
    }

    return products;
}
    private Product mapRow(ResultSet rs) throws Exception {
        Product p = new Product();
        p.setId(rs.getInt("ProductID"));
        p.setName(rs.getString("ProductName"));
        p.setPrice(rs.getDouble("PriceVNDPerKg"));
        p.setQuantityKg(rs.getDouble("QuantityKg"));

        java.sql.Date d = rs.getDate("HarvestDate");
        if (d != null) p.setHarvestDate(d.toLocalDate());

        return p;
    }
    
    private String getImageForProduct(String name) {
    return switch (name) {
        case "Nhãn lồng Hưng Yên"  -> "images/products/nhan-long.jpg";
        case "Vải thiều Lục Ngạn"  -> "images/products/vai-thieu.jpg";
        case "Cam sành Hàm Yên"    -> "images/products/cam-sanh.jpg";
        case "Chuối tiêu hồng"     -> "images/products/chuoi-tieu.jpg";
        
        default -> "images/products/default.jpg";
    };
}
}