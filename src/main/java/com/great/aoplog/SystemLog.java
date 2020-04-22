package com.great.aoplog;
import java.util.Date;

/**
 * 日志实体
 * 
 * @author zx
 * 
 */
public class SystemLog {
	private int id;

	private String description;

	private String method;

	private String logType;

	private String requestIp;

	private String exceptioncode;

	private String exceptionDetail;


	private String createBy;

	private Date createDate;

	private int schoolId;

	private String account;


	public SystemLog()
	{
	}



	public int getId() {
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method == null ? null : method.trim();
	}

	public String getLogType()
	{
		return logType;
	}

	public void setLogType(String logType)
	{
		this.logType = logType;
	}

	public String getRequestIp() {
		return requestIp;
	}

	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp == null ? null : requestIp.trim();
	}

	public String getExceptioncode() {
		return exceptioncode;
	}

	public void setExceptioncode(String exceptioncode) {
		this.exceptioncode = exceptioncode == null ? null : exceptioncode
				.trim();
	}

	public String getExceptionDetail() {
		return exceptionDetail;
	}

	public void setExceptionDetail(String exceptionDetail) {
		this.exceptionDetail = exceptionDetail == null ? null : exceptionDetail
				.trim();
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy == null ? null : createBy.trim();
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getSchoolId()
	{
		return schoolId;
	}

	public void setSchoolId(int schoolId)
	{
		this.schoolId = schoolId;
	}

	public String getAccount()
	{
		return account;
	}

	public void setAccount(String account)
	{
		this.account = account;
	}
}
