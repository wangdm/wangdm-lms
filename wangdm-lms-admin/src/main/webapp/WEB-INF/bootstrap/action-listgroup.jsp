<div class="datagrid">
    <div class="panel panel-default">
        <div class="panel-heading">Panel heading without title</div>
            <table class="table table-bordered table-hover table-condensed">
                <thead>
                    <tr>
    	                <#if columns??>
    	                <#list columns as column >
                        <th>${column}</th>
    	                </#list>
    	                </#if>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                    </tr>
                </tbody>
            </table>
        <div class="panel-footer">
            <div class="operation-bar">
                <span class="operation">添加用户组</span>
                <span class="operation">删除所选用户组</span>
            </div>
        </div>
    </div>
</div>