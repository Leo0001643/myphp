<?php
/**
 *                          RoleController.class.php
 * ==============================================================
 *      Copy right 2020-2023 成都云山互娱科技有限公司 保留所有权利
 * --------------------------------------------------------------
 *                官方网址: https://www.chookc.com
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用
 *          任何企业和个人不允许对程序代码以任何形式任何目的再发布
 * ==============================================================
 */


namespace Admin\Controller;


class RoleController extends AdminController
{
    public function index(){
        //获取树形结构的权限列表
        $list = M('Menu')->order('sort asc')->select();
        $this->assign('list',get_tree($list));
        $this->display();
    }
}