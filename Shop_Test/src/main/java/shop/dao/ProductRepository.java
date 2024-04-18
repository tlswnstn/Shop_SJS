package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {
	
	 /**
     * 상품 목록 조회
     * @return 상품 목록
     */
    public List<Product> list() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM product";
        
        try {
            psmt = con.prepareStatement(sql);
            
            rs = psmt.executeQuery();
            
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getString("product_id"));
                product.setName(rs.getString("name"));
                product.setUnitPrice(rs.getInt("unit_price"));
                product.setDescription(rs.getString("description"));
                product.setManufacturer(rs.getString("manufacturer"));
                product.setCategory(rs.getString("category"));
                product.setUnitsInStock(rs.getInt("units_in_stock"));
                product.setCondition(rs.getString("condition"));
                product.setFile(rs.getString("file"));
                productList.add(product);
            }
            
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return productList;
    }
	
	/**
	 * 상품 목록 검색
	 * @param keyword
	 * @return
	 */
	public List<Product> list(String keyword) {
		
	}
	
	/**
	 * 상품 조회
	 * @param productId
	 * @return
	 */
	public Product getProductById(String productId) {
	        String sql = "SELECT * FROM product WHERE product_id = ?";
	        
	        try {
	            psmt = con.prepareStatement(sql);
	            
	            psmt.setString(1, productId);
	            
	            rs = psmt.executeQuery();
	            
	            while (rs.next()) {
	                Product product = new Product();
	                product.setProductId(rs.getString("product_id"));
	                product.setName(rs.getString("name"));
	                product.setUnitPrice(rs.getInt("unit_price"));
	                product.setDescription(rs.getString("description"));
	                product.setManufacturer(rs.getString("manufacturer"));
	                product.setCategory(rs.getString("category"));
	                product.setUnitsInStock(rs.getInt("units_in_stock"));
	                product.setCondition(rs.getString("condition"));
	                product.setFile(rs.getString("file"));

	                return product;
	            }
	            
	            rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	}
	
	
	/**
	 * 상품 등록
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		
	}
	
	
	/**
	 * 상품 수정
	 * @param product
	 * @return
	 */
	public int update(Product product) {
		
	}
	
	
	
	/**
	 * 상품 삭제
	 * @param product
	 * @return
	 */
	public int delete(String productId) {
		
	}

}





























