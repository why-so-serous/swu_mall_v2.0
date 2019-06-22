package cn.swu.service;

import cn.swu.mapper.PropertyMapper;
import cn.swu.pojo.Property;
import cn.swu.pojo.PropertyExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * PropertyService 实现类
 */
@Service
public class PropertyServiceImpl implements PropertyService {

	@Autowired
	PropertyMapper propertyMapper;

	public void add(Property property) {
		propertyMapper.insert(property);
	}

	public void delete(Integer id) {
		propertyMapper.deleteByPrimaryKey(id);
	}

	public void update(Property property) {
		propertyMapper.updateByPrimaryKey(property);
	}

	public List<Property> list(Integer category_id) {
		PropertyExample example = new PropertyExample();
		example.or().andCategory_idEqualTo(category_id);
		List<Property> properties = propertyMapper.selectByExample(example);
		return properties;
	}

	public Property get(Integer id) {
		return propertyMapper.selectByPrimaryKey(id);
	}
}
