<?php

namespace App\Admin\Controllers;

use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProductController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Product';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Product());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('categoryID', __('CategoryID'));
        $grid->column('price', __('Price'));
        $grid->column('img')->image('','50','50');
        $grid->column('brief_description', __('Brief description'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('details_description', __('Details description'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Product::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('categoryID', __('CategoryID'));
        $show->field('price', __('Price'));
        $show->field('img', __('Img'));
        $show->field('brief_description', __('Brief description'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('details_description', __('Details description'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Product());

        $form->text('name', __('Name'));
        $form->number('categoryID', __('CategoryID'));
        $form->decimal('price', __('Price'));
        $form->image('img', __('Img'));
        $form->text('brief_description', __('Brief description'));
        $form->textarea('details_description', __('Details description'));

        return $form;
    }
}
