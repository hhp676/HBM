package com.hginfo.hbm.base.entity;


import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Future;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import com.hginfo.hbm.annotation.IgnoreSqlFilter;
import com.hginfo.hbm.base.BizEntity;

@Entity(name = "T_ORDER")
public class TOrder extends BizEntity {


	private static final long serialVersionUID = -6840486221233899363L;
	private Long orderId;
	
	//可通过groups形式分组验证，使用@Validated({TestValid.class})指定
	//@NotEmpty(groups={TestValid.class})
	@NotEmpty
	private String clientname;
	
	@NotNull
	@DecimalMax("52.3")
	@DecimalMin("15.1")
	private BigDecimal amount;
	
	@NotNull
	@Future
	private Date createtime;
	
	@NotBlank
	private String testName;
	
	@NotNull
	@Max(100)
	@Min(10)
	private Integer testSize;
	
	@NotNull
	@Length(max=100,min=7)
	private String testRemark;
	
	//@NotSpaces
	private String testSpace;
	
	//@Mobile
	private String testMobile;
	
	@IgnoreSqlFilter
	private String testSubSql;
	
	private long testNum;
	
	@Transient
	public String getTestSpace() {
		return testSpace;
	}

	public void setTestSpace(String testSpace) {
		this.testSpace = testSpace;
	}

	public TOrder() {
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID_")
	public Long getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	@Column(name = "CLIENTNAME_")
	public String getClientname() {
		return this.clientname;
	}

	public void setClientname(String clientname) {
		this.clientname = clientname;
	}

	@Column(name = "AMOUNT_", precision = 22, scale = 2)
	public BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATETIME")
	public Date getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Transient
	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	@Transient
	public Integer getTestSize() {
		return testSize;
	}

	public void setTestSize(Integer testSize) {
		this.testSize = testSize;
	}

	@Transient
	public String getTestRemark() {
		return testRemark;
	}

	public void setTestRemark(String testRemark) {
		this.testRemark = testRemark;
	}

	@Transient
	public String getTestMobile() {
		return testMobile;
	}

	public void setTestMobile(String testMobile) {
		this.testMobile = testMobile;
	}

	@Transient
	public long getTestNum() {
		return testNum;
	}

	public void setTestNum(long testNum) {
		this.testNum = testNum;
	}

    @Override
    @Transient
    public Long getId() {
        return getOrderId();
        
    }

    @Override
    public void setId(Long id) {
        setOrderId(id);
    }

    @Transient
    public String getTestSubSql() {
        return testSubSql;
    }

    public void setTestSubSql(String testSubSql) {
        this.testSubSql = testSubSql;
    }

}
