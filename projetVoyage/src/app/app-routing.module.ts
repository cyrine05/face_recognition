import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DetailsComponent } from './details/details.component';
import { ListVoyagesComponent } from './list-voyages/list-voyages.component';
import { ModifierVoyageComponent } from './modifier-voyage/modifier-voyage.component';
import { AjoutVoyageComponent } from './voyages/ajoutVoyage.component';

const routes: Routes = [
  {path:"Details",component:DetailsComponent},
  {path:"liste", component:ListVoyagesComponent},
  {path:"ajout", component:AjoutVoyageComponent},
  {path:"modifier/id", component:ModifierVoyageComponent},
  {path:"**", component:ListVoyagesComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
