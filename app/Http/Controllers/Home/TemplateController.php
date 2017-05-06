<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Template;

class TemplateController extends Controller
{

    public function index()
    {
        $templates = Template::paginate(4);

        return view('home.template.index')->with(
            [
                'templates' => $templates,
            ]
        );
    }
}

