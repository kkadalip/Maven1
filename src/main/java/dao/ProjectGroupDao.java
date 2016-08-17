package dao;

import java.util.List;

import dao.AbstractDao.DataAccessLayerException;
import model.Project;
import model.ProjectGroup;

public class ProjectGroupDao extends AbstractDao {

	public ProjectGroupDao() {
		super();
	}

    public List getAll(){ // throws DataAccessLayerException{
        return super.getAll(ProjectGroup.class);
    }

}
