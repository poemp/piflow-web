package com.nature.component.workFlow.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import com.nature.base.BaseHibernateModelUUIDNoCorpAgentId;
import com.nature.component.template.vo.StopTemplateVo;

@Entity
@Table(name =  "flow_template")
public class Template extends BaseHibernateModelUUIDNoCorpAgentId {

	private static final long serialVersionUID = 1L;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_FLOW_ID")
	private Flow flow; 

	private String name;
	
	@Column(name = "description",columnDefinition="varchar(1000) COMMENT '描述'")
	private String description;
	
	@Lob @Basic(fetch = FetchType.LAZY) @Type(type="text") @Column(name="value", nullable=true)
	private String value;
	
	private String path;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "template")
	private List<StopTemplateVo> stopsList = new ArrayList<StopTemplateVo>();

 	public Flow getFlow() {
		return flow;
	}

	public void setFlow(Flow flow) {
		this.flow = flow;
	} 

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<StopTemplateVo> getStopsList() {
		return stopsList;
	}

	public void setStopsList(List<StopTemplateVo> stopsList) {
		this.stopsList = stopsList;
	}
}