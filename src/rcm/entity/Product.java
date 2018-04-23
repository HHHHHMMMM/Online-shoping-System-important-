package rcm.entity;

public class Product {
	private Integer id;
	private String productName;
	private Integer classify;
	private String picPath;
	private String describ;
	private double price;
	private Classify classifyObject;
	
	public Product(){
		
	}
	
	public Product(Integer id, String productName, Integer classify,
			String picPath, String describ, double price) {
		super();
		this.id = id;
		this.productName = productName;
		this.classify = classify;
		this.picPath = picPath;
		this.describ = describ;
		this.price = price;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getClassify() {
		return classify;
	}

	public void setClassify(Integer classify) {
		this.classify = classify;
	}

	public String getPicPath() {
		return picPath;
	}

	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}

	public String getDescrib() {
		return describ;
	}

	public void setDescrib(String describ) {
		this.describ = describ;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Classify getClassifyObject() {
		return classifyObject;
	}

	public void setClassifyObject(Classify classifyObject) {
		this.classifyObject = classifyObject;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Product){
			Product other = (Product) obj;
			return this.id.equals(other.getId());
		}else{
			return false;
		}
	}
	
}
