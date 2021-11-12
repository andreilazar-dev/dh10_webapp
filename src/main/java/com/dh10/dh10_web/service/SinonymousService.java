package com.dh10.dh10_web.service;

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
            if (tmp.getStatus() == 1) {
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

        for (Synonymus tmp : completeList) {

            if (stats.containsKey(tmp.getAlgorithm_name())){
                Integer value = stats.get(tmp.getAlgorithm_name());
                stats.put(tmp.getAlgorithm_name(), value + 1);
            }
            else {
                stats.put(tmp.getAlgorithm_name(),1);
            }
        }
        return  stats;
    }
    public void synonymousUpdate(List<Synonymus> synonymuses) {
        synonymusDao.update(synonymuses);
    }
}
