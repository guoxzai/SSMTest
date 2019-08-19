package com.gxz.sys.utils;

import java.util.ArrayList;
import java.util.List;

import com.gxz.sys.utils.jsondata.MenuTreeNode;

public class BuilderEasyuiComboTree {

	public static List<MenuTreeNode> builderCombTree(List<MenuTreeNode> MenuTreeNode,Integer topId){
		List<MenuTreeNode> nodes = new ArrayList<>();
		for (MenuTreeNode treeNode1 : MenuTreeNode) {
			if(treeNode1.getPid() == topId){
				nodes.add(treeNode1);
			}
			
			for (MenuTreeNode treeNode2 : MenuTreeNode) {
				if(treeNode1.getId() == treeNode2.getPid()){
					treeNode1.getChildren().add(treeNode2);
				}
				
			}
		}
		return nodes;
	}
	
}
