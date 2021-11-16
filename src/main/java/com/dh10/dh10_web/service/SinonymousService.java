package com.dh10.dh10_web.service;

import com.dh10.access.model.beans.User;
import com.dh10.access.model.dao.UserDao;
import com.dh10.stringchecker.model.beans.Synonymus;
import com.dh10.stringchecker.model.dao.Dao;
import com.dh10.stringchecker.model.dao.SynonymusDao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SinonymousService {

    private List<Synonymus> completeList = null;
    private Dao<Synonymus> synonymusDao;

    public SinonymousService() {
        synonymusDao = new SynonymusDao();
        completeList = synonymusDao.getAll();
    }

    public void refreshList() {
        completeList = synonymusDao.getAll();
    }

    public List<Synonymus> synonymusByCountry(String standardCountry) {
        List<Synonymus> byCountry = new ArrayList<>();

        for (Synonymus tmp : completeList) {
            if (tmp.getCountry() != null && tmp.getCountry().getCountry_name().equals(standardCountry)) {
                byCountry.add(tmp);
            }
        }
        return byCountry;
    }
    
    

    public List<Synonymus> synonymusToApprove() {
        List<Synonymus> toApprove = new ArrayList<>();

        for (Synonymus tmp : completeList) {
            if (tmp.getStatus() == 1 && tmp.getAlgorithm_name() != null) {
                toApprove.add(tmp);
            }
        }
        return toApprove;
    }

    public List<Synonymus> synonymusUnassociated() {
        List<Synonymus> unassociated = new ArrayList<>();

        for (Synonymus tmp : completeList) {
            if (tmp.getCountry() == null) {
                unassociated.add(tmp);
            }
        }
        return unassociated;
    }

    public List<Synonymus> synonymusAll() {
        return completeList;
    }

    public Map<String,Integer> getAlgorithmStats(){
        Map<String,Integer> stats = new HashMap<>();
        String name;
        for (Synonymus tmp : completeList) {

            name = tmp.getAlgorithm_name() == null ?"Non trovati":tmp.getAlgorithm_name();
            if (stats.containsKey(name)){

                Integer value = stats.get(name);
                stats.put(name, value + 1);
            }
            else {
                stats.put(name,1);
            }
        }
        stats.remove("");
        return  stats;
    }
    public void synonymousUpdate(List<String> synonymuses) {

        List<Synonymus> update = new ArrayList<>();
        for (Synonymus tmp : completeList) {
            if(synonymuses.contains(tmp.getSynonymus_name())){
                tmp.setStatus(0);
                update.add(tmp);
            }
        }
        synonymusDao.update(update);
    }
    
    public int countToAssociate() {
    	return this.synonymusUnassociated().size();
    }
    
    public int countToApprove() {
    	return this.synonymusToApprove().size();
    }
    
    public int countAll() {
    	return this.synonymusAll().size();
    }
    
    public int countSynonymusCountry(String standardCountry) {
    	return this.synonymusByCountry(standardCountry).size();
    }
    
    public int countCountry() {
    	int numCountry=0;
    	for(Synonymus s1 : completeList) {
    		for(Synonymus s2 : completeList) {
    			if((s1.getCountry()!=null)&&(s2.getCountry()!=null)&&(s1.equals(s2))) numCountry++;
    		}
    	}
    	return numCountry;
    }
    
    public List<String>  getCountries(){
    	ArrayList<String> countries = new ArrayList<String>();
    	for(Synonymus s1 : completeList) {
    		if((s1.getCountry()!=null)&&(!countries.contains(s1.getCountry().getCountry_name())))
    			countries.add(s1.getCountry().getCountry_name());
    	}
    	return countries;
    }

    private com.dh10.access.model.dao.Dao<User> userDao = new UserDao();
    public User getUser(String id){
        return userDao.get(id);
    }
    
    
    
    
}
