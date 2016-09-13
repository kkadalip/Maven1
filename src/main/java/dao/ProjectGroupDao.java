package dao;

import java.util.List;

//import dao.AbstractDao.DataAccessLayerException;
//import model.Project;
import model.ProjectGroup;

public class ProjectGroupDao extends AbstractDao {

	public ProjectGroupDao() {
		super();
	}

    @SuppressWarnings("unchecked")
	public List<ProjectGroup> getAll(){ // throws DataAccessLayerException{
        return (List<ProjectGroup>) super.getAll(ProjectGroup.class);
    }

}
